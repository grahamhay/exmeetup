# Exmeetup

Meetup API Elixir Client library (unofficial)

## Installation

The package can be installed as:

  1. Add `exmeetup` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:exmeetup, "~> 0.0.1"}]
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
      meetup_name: "San-Diego-Elixir-Erlang"
      access_token: System.get_env("MEETUP_ACCESS_TOKEN") || "",
      decoder: :atoms # :atoms (not efficient), :string (suggested, most efficient)
    ```

## Usage

If you need only body of api response, add bang(!) end of methods. On the other hand
if you need header, body and response then use normal functions without ! sign.

```elixir
Exmeetup.Resource.Event.all!

Exmeetup.Resource.Event.all
```

## Contributing

### Issues, Bugs, Documentation, Enhancements

1) Fork the project.

2) Make your improvements and write your tests.

3) Make a pull request.
