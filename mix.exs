defmodule LyricsOnTerminal.MixProject do
  use Mix.Project

  def project do
    [
      app: :lyrics_on_terminal,
      version: "0.1.0",
      elixir: "~> 1.11",
      escript: escript_config(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      { :httpoison, "~> 1.6" },
      { :poison, "~> 3.1"    },
    ]
  end

  defp escript_config do
    [main_module: LyricsOnTerminal.CLI]
  end
end
