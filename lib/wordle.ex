defmodule Games.Wordle do
  def play, do: play(generate_answer(), 1)

  def play(answer, attempt) do
    user_input = String.trim IO.gets "Enter a 5-letter word: "

    if attempt < 5 do
      result = calculate_guess(answer, user_input)
      if result == [:grey, :green, :green, :green, :green] do
        IO.puts "You win."
      else
        play(answer, attempt + 1)
      end
    else
      IO.puts """
        You lose!
        The correct answer was '#{answer}'
      """
    end
  end

  def calculate_guess(answer, user_input) do
    IO.puts answer
    IO.puts user_input

    # input_enum = String.graphemes(user_input)
    # answer_enum = String.graphemes(answer)

    [:grey, :green, :green, :green, :green]

    # IO.ANSI.yellow()
    # IO.ANSI.light_black()
  end

  def generate_answer do
    Enum.random([
      "toast",
      "tarts",
      "hello",
      "beats"
    ])
  end
end
