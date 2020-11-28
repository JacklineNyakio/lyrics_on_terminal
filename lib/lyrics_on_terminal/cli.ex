# User enters a song title and the artist name, They get lyrics
defmodule LyricsOnTerminal.CLI do
  def main(argv) do
    argv
    |> parse_args
    |> process
  end

    # The args can either be -h or --help which returns :help
    # Else it is an artist and song
    # Return a tuple of {artist, song}, or :description if it was given
  # """
  defp parse_args(argv) do
    OptionParser.parse(argv, switches: [ help: :boolean ],
                      aliases: [h: :help])
    |> elem(1) #OptionParser.parse returns {parsed, args, invalid} -> gets args
    |> args_to_internal_representation()
  end

  defp args_to_internal_representation([artist, song]) do
    { artist, song }
  end

  defp args_to_internal_representation(_) do
    :help
  end


  # Processes the arguments that the user passes
  defp process(:help) do
    IO.puts """
        Pass in the ARTIST name and the SONG title you want lyrics to.
      """
      System.halt(0)
  end

  defp process({ artist, song }) do
    LyricsOnTerminal.Lyrics.fetch(artist, song)
    |> decode_response()
  end

  defp decode_response({:ok, body}), do: body["lyrics"]
  defp decode_response({:error, error}) do
    IO.puts "Error while fetching lyrics: #{error["message"]}"
    System.halt(2)
  end

  # format body
  # Body with content -> remove all of the /n -> replace with new line
  # Empty body -> Tell user that the lyrics are not in yet
#   def format_lyrics(lyrics) do
#     lyrics
#     |> Regex.replace(~r[\\n|\\r], "\s")
#   end
end
