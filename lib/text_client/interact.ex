defmodule TextClient.Interact do
  defstruct game_service: nil, tally: nil, last_guess: ""

  def start do
    Hangman.new_game()
    |> setup_state
  end

  defp setup_state(game) do
    %__MODULE__{
      game_service: game,
      tally: Hangman.tally(game)
    }
  end
end
