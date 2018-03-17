defmodule TextClient.Player do
  alias TextClient.{Prompt, State, Summary}

  def play(%State{tally: %{game_state: :good_guess}} = game) do
    continue_with_message(game, "Good guess!")
  end

  def play(%State{tally: %{game_state: :bad_guess}} = game) do
    continue_with_message(game, "Nope, sorry.")
  end

  def play(%State{tally: %{game_state: :already_guessed}} = game) do
    continue_with_message(game, "You already tried that letter.")
  end

  def play(%State{tally: %{game_state: :won}}) do
    exit_with_message("Congratulations, you won!")
  end

  def play(%State{tally: %{game_state: :lost}}) do
    exit_with_message("Oh dear, you lost.")
  end

  def play(game) do
    continue(game)
  end

  defp continue(game) do
    game
    |> Summary.display()
    |> Prompt.accept_move()
    |> make_move
    |> play
  end

  defp make_move(game) do
    game
  end

  defp continue_with_message(game, message) do
    IO.puts(message)
    play(game)
  end

  defp exit_with_message(message) do
    IO.puts(message)
    exit(:normal)
  end
end
