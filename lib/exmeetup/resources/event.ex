defmodule Exmeetup.Resource.Event do
  @moduledoc """
  Meetup `Event` resource api calls.
  """

  use Bang
  import Exmeetup.Client

  @bang {[all: 0, all: 1, find: 1], {Exmeetup.Client, :body!}}

  @doc """
  List all events
  """
  def all(opts \\ %{})
  def all(json_api: true), do: json_api(all, "events")
  def all(opts), do: get("/events", opts)

  @doc """
  Get a specific event.
  """
  def find(event_id, json_api: true), do: json_api(find(event_id),"events")
  def find(event_id), do: get("/events/#{event_id}")
end
