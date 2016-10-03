# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :exmeetup,
  api_base_uri: "https://api.meetup.com/",
  meetup_name: System.get_env("MEETUP_NAME") || "",
  access_token: System.get_env("MEETUP_ACCESS_TOKEN") || "",
  decoder: :string # :atoms (not efficient), :string (suggested, most efficient)
