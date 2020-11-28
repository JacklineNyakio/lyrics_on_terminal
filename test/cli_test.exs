defmodule CliTest do
  use ExUnit.Case
  doctest LyricsOnTerminal

  import LyricsOnTerminal.CLI

  test "description is returned by parsing with -h and --help options" do
    assert parse_args(["-h", "anything"])     == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "if the artist and the song are given, they are returned" do
    assert parse_args(["coldplay", "adventure of a lifetime"]) == { "coldplay", "adventure of a lifetime" }
  end
end
