defmodule Odometex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :odometex,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description(),
      name: "Odometex",
      package: package(),
      source_url: "https://github.com/dsantosmerino/odometex"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 0.9.1", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.14", only: :dev},
      {:poison, "~> 3.1"},
    ]
  end

  defp description do
    "Simple distance comparisons for Elixir."
  end

  defp package do
    [
      maintainers: ["David Santos Merino"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/dsantosmerino/odometex"}
    ]
  end
end
