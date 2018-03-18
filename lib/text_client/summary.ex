defmodule TextClient.Summary do
  def display(%{tally: tally} = game) do
    IO.puts([
      "\n",
      "Word so far: #{tally.letters |> Enum.join(" ")}\n",
      "Letters guessed: #{tally.guessed_letters |> Enum.join(" ")}\n",
      "Guesses remaining: #{tally.remaining_guesses}\n"
    ])

    game
  end
end
