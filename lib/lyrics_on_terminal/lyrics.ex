defmodule LyricsOnTerminal.Lyrics do
  def fetch(artist, song) do
    lyrics_url(artist, song)
    |>HTTPoison.get
    |> handle_response
  end

  def lyrics_url(artist, song) do
    "https://api.lyrics.ovh/v1/#{artist}/#{song}"
  end

  def handle_response({ :ok, %{status_code: status_code, body: body}}) do
      {
        status_code |> check_for_error(),
        body        |> Poison.Parser.parse!()
      }
  end

  defp check_for_error(200), do: :ok
  defp check_for_error(_), do: :error
end
