defmodule FinTex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :fintex,
      version: "0.3.3",
      name: "FinTex",
      source_url: "https://github.com/my-flow/fintex",
      homepage_url: "http://hexdocs.pm/fintex",
      elixir: "~> 1.9",
      description: "HBCI/FinTS client library for Elixir.",
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:bankster, "~> 0.3.1"},
      {:decimal, "~> 1.8.0"},
      {:exactor, "~> 2.2.4"},
      {:httpotion, "~> 3.1.2"},
      {:luhn, "~> 0.3.2"},
      {:vex, "~> 0.8.0"},
      {:xml_builder, "~> 2.1.1"},
      {:mt940, git: "https://github.com/n0isiv/mt940.git", tag: "1.1.4"}
    ]
  end

  defp package do
    [
      files: ["lib", "priv", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Florian J. Breunig"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/my-flow/fintex"}
    ]
  end
end
