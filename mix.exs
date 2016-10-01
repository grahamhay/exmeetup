defmodule Exmeetup.Mixfile do
  use Mix.Project

  def project do
    [app: :exmeetup,
     version: "0.0.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps(),
     docs: [extras: ["README.md"]]]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison, :poison]]
  end

  # Dependencies can be Hex packages:
  #
  defp deps do
    [
      {:httpoison, "~> 0.9.2"},
      {:poison, "~> 2.2"},
      {:bang, "~> 0.1.0"},
      {:ex_doc, "~> 0.13.0", only: :dev}
    ]
  end

  defp description do
    """
    Meetup API client.
    """
  end

  defp package do
    [name: :exmeetup,
     files: ["lib", "mix.exs", "README.md"],
     maintainers: ["Mark Siemers"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/marksiemers/exmeetup"}]
  end
end
