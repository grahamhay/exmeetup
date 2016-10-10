# Exmeetup

Meetup API Elixir Client library (unofficial)

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
      meetup_name: "San-Diego-Elixir-Erlang"
      access_token: System.get_env("MEETUP_ACCESS_TOKEN") || "",
      decoder: :atoms # :atoms (not efficient), :string (suggested, most efficient)
    ```

## Usage
Normal method calls will return a status, headers, and body of response, wrapped in a tuple (with `:ok` or `:error`)
If you want only the body (still wrapped in a tuple), pipe through Exmeetup.Client.body
If you want only the body of api response, add bang(!) end of methods.

```elixir
# Fetch the header, body, and status
Exmeetup.Resource.Event.all
#=> {:ok,
#=>   %{body: [%{"created" => 1473384275000, ... }],
#=>     headers: [{"Date", "Mon, 03 Oct 2016 17:24:28 GMT"}, ... ],
#=>     status: 200
#=>   }
#=> }

# Fetch the body and status (no header, no HTTP status, wrapped in a tuple)
Exmeetup.Resource.Event.all |> Exmeetup.Client.body
#=> {:ok,
#=>   [%{"created" => 1473384275000, "description" => "...", ... }]
#=> }

# Fetch only the body (no header, no HTTP status, no tuple)
Exmeetup.Resource.Event.all!
#=> [%{"created" => 1473384275000, "description" => "...", ... }]
```

## Contributing

### Issues, Bugs, Documentation, Enhancements

1) Fork the project.

2) Make your improvements and write your tests.

3) Make a pull request.
