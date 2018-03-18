defmodule TextClient.Player do
  alias TextClient.{Move, Prompt, State, Summary}

  def play(%State{tally: %{state: :good_guess}} = game) do
    continue_with_message(game, "Good guess!")
  end

  def play(%State{tally: %{state: :bad_guess}} = game) do
    continue_with_message(game, "Nope, sorry.")
  end

  def play(%State{tally: %{state: :already_guessed}} = game) do
    continue_with_message(game, "You already tried that letter.")
  end

  def play(%State{tally: %{state: :won, letters: letters}}) do
    exit_with_message("Congratulations, you won! The word was '#{Enum.join letters}'.")
  end

  def play(%State{tally: %{state: :lost}}) do
    exit_with_message("Oh dear, you lost.")
  end

  def play(game) do
    continue(game)
  end

  defp continue(game) do
    game
    |> Summary.display()
    |> Prompt.accept_move()
    |> Move.make_move()
    |> play
  end

  defp continue_with_message(game, message) do
    IO.puts(message)
    continue(game)
  end

  defp exit_with_message(message) do
    IO.puts(message)
    exit(:normal)
  end
end
