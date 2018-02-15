defmodule TextClient do
  @moduledoc """
  Hangman game text client API
  """

  alias TextClient.Interact

  defdelegate start, to: Interact
end
