defmodule TextClient.Move do
  alias TextClient.State

  def make_move(%State{} = game) do
    {game_service, tally} = Hangman.make_move(game.game_service, game.guess)
    %{game | game_service: game_service, tally: tally}
  end
end
