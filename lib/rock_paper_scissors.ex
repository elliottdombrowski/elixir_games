defmodule Games.RockPaperScissors do
  def play do
    choices = ["rock", "paper", "scissors"]
    ai_choice = Enum.random choices
    user_choice = IO.gets("Choose rock, paper, or scissors: ")

    # Cleanse input
    user_choice = String.trim(user_choice)

    # Check if input is in options
    unless Enum.member?(choices, user_choice), do: raise "Invalid choice."

    IO.puts "AI picked #{ai_choice}."
    IO.puts "You picked #{user_choice}."

    case {user_choice, ai_choice} do
      {"rock", "scissors"}  -> "You win!"
      {"paper", "rock"}     -> "You win!"
      {"scissors", "paper"} -> "You win!"

      {"scissors", "rock"}  -> "You lose."
      {"rock", "paper"}     -> "You lose."
      {"paper", "scissors"} -> "You lose."

      _ -> "It's a tie!"
    end
  end
end
