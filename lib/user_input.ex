defmodule Games.UserInput do
  @doc """
  Returns boolean representing the validity of a user's input

  iex> Games.UserInput.validate("scissors", ["rock", "paper", "scissors"])
  true

  iex> Games.UserInput.validate("water", ["rock", "paper", "scissors"])
  false
  """
  def validate(input, choices) do
    input in choices
  end
end
