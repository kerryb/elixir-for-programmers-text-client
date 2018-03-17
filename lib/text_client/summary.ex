defmodule TextClient.Summary do
  def display(%{tally: tally}) do
    IO.puts([
      "\n",
      "Word so far: #{tally.letters |> Enum.join(" ")}\n",
      "Guesses remaining: #{tally.guesses_remaining}\n"
    ])
  end
end
