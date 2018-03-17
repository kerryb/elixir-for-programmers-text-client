defmodule TextClient.Prompt do
  alias TextClient.State

  def accept_move(%State{} = game) do
    "Your guess: "
    |> IO.gets()
    |> check_input(game)
  end

  defp check_input(input, %State{} = game) when is_binary(input) do
    guess = String.trim(input)
    if guess =~ ~r/\A[a-z]\z/ do
      %{game | guess: guess}
    else
      IO.puts("\nPlease enter a single lower case letter")
      accept_move(game)
    end
  end

  defp check_input(_, _), do: exit(:normal)
end
