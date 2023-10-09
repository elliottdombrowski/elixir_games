defmodule Games.Wordle do
  def play do
    play(1)
  end
  def play(attempt) do
    IO.puts "ATTEMPT => #{attempt}"
    answer = generate_answer()
    user_input = String.trim IO.gets "Enter a 5-letter word: "

    IO.puts "INPUT, ANSWER => #{user_input}, #{answer}"

    if attempt < 5 do
      play(attempt + 1)
    else
      IO.puts "You lose!"
      IO.puts "The correct answer was #{answer}"
    end
    # feedback(answer, user_input)
  end

  def feedback(answer, user_input) do
    user_input = String.graphemes(user_input)

    Enum.reduce(user_input, fn str, acc ->
      cond do
        answer =~ str -> IO.ANSI.yellow() <> str
        true -> acc <> IO.ANSI.light_black() <> str
      end
    end)
  end

  defp generate_answer do
    Enum.random([
      "toast",
      "tarts",
      "hello",
      "beats"
    ])
  end
end
