defmodule Exmeetup do
  @moduledoc """
  Meetup API Client Implementation.

  ## Installation

  The package can be installed as:

    1. Add `exmeetup` to your list of dependencies in `mix.exs`:

      ```elixir
      def deps do
        [{:exmeetup, "~> 0.0.3"}]
      end
      ```

    2. Ensure `exmeetup` is started before your application:

      ```elixir
      def application do
        [applications: [:exmeetup]]
      end
      ```

    3. Add your configuration to your config/config.exs

      ```elixir
      config :exmeetup,
        api_base_uri: "https://api.meetup.com/",
        meetup_name: "your-meetup-name",
        access_token: System.get_env("MEETUP_ACCESS_TOKEN") || "",
        decoder: :string # :atoms (not efficient), :string (suggested, most efficient)
      ```

  ## Usage

  If you need only body of api response, add ! end of methods. On the other hand
  if you need header, body and response then use normal functions without ! sign.

  ```elixir
  Exmeetup.Resource.Event.all!

  Exmeetup.Resource.Event.all
  ```
  """
end
