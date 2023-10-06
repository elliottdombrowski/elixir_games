defmodule Games.RockPaperScissors do
  def play do
    choices = ["rock", "paper", "scissors"]
    ai_choice = Enum.random choices

    # Get input from user via IEX shell
    user_choice = String.trim IO.gets("Choose rock, paper, or scissors: ")

    # Check if input is in options
    case Games.UserInput.validate(user_choice, choices) do
      true -> calculate_victor(user_choice, ai_choice)
      _ -> play()
    end
  end

  defp calculate_victor(user_choice, ai_choice) do
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
