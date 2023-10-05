defmodule Games.GuessingGame do
  def play do
    correct_answer = 7
    user_input = IO.gets "Guess a number between 1 and 10: "

    user_input
    |> String.trim()
    |> String.to_integer()
    |> calculate_answer(correct_answer)
  end

  defp calculate_answer(user_input, correct_answer) do
    cond do
      user_input == correct_answer -> "Correct!"
      user_input > correct_answer -> "Too high!"
      user_input < correct_answer -> "Too low!"
    end
  end
end
