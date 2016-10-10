defmodule Exmeetup.Client do
  @moduledoc """
  Exmeetup Client Module.
  """

  import HTTPoison, only: [request: 5]

  @doc """
  HTTP GET request to Meetup API
  """
  def get(path, opts \\ ""), do: call(path, :get, opts)

  @doc """
  HTTP POST request to Meetup API
  """
  def post(path, opts \\ ""), do: call(path, :post, opts)

  @doc """
  HTTP PUT request to Meetup API
  """
  def put(path, opts \\ ""), do: call(path, :put, opts)

  @doc """
  HTTP DELETE request to Meetup API
  """
  def delete(path, opts \\ ""), do: call(path, :delete, opts)

  @doc """
  Fetch only body from response
  """
  def body!({:ok, resp}), do: resp.body
  def body!({:error, error}), do: error
  def body({:ok, resp}), do: {:ok, resp.body}
  def body({:error, error}), do: {:error, error}

  def json_api({:error, error}), do: {:error, error}
  def json_api({:ok, %{body: body}}, type) when is_list(body) do
    %{ data: Enum.map(body, &json_api(&1, type)) }
  end
  def json_api({:ok, %{body: body}}, type), do: %{ data: json_api(body, type) }
  def json_api(item, type) do
    item_without_id = Enum.filter(item, fn({k,_v}) -> !(k in [:id,"id"]) end)
    %{
        type: type,
        id: item.id,
        attributes: attributes(item_without_id),
        relationships: relationships(item_without_id)
      }
  end

  defp attributes(item), do: Enum.filter(item, fn({_k,v}) -> !is_map(v) end)
  defp relationships(item), do: Enum.filter(item, fn({_k,v}) -> is_map(v) end)

  defp call(path, method, opts) do
    method
    |> request(gen_endpoint(path), encode_options(opts), headers, [])
    |> response
  end

  defp encode_options(nil), do: nil
  defp encode_options(opts), do: Poison.encode!(opts)

  defp response({:error, error}), do: {:error, error.reason}
  defp response({:ok, %HTTPoison.Response{body: nil} = resp}),
    do: {:ok, %{body: nil, headers: resp.headers, status: resp.status_code}}
  defp response({:ok, resp}) do
    {:ok, %{body: Poison.decode!(resp.body, keys:
      Application.get_env(:exmeetup, :decoder)),
      headers: resp.headers, status: resp.status_code}}
  end

  defp headers do
    %{
        "Content-Type" => "application/json",
        "User-Agent" => "exmeetup",
        "Authorization" => "Bearer #{Application.get_env(:exmeetup, :access_token)}"
    }
  end

  defp gen_endpoint(path) do
    Application.get_env(:exmeetup, :api_base_uri)
    <> Application.get_env(:exmeetup, :meetup_name)
    <> path
  end
end
