defmodule Games.Wordle do
  def play, do: play(generate_answer(), 1)

  def play(answer, attempt) do
    user_input = String.trim(IO.gets("Enter a 5-letter word: "))

    answer_list = parse_string(answer)
    user_input = parse_string(user_input)

    if attempt < 5 do
      result = calculate_guess(answer_list, user_input)

      if result == [:green, :green, :green, :green, :green] do
        IO.puts("You win.")
      else
        play(answer, attempt + 1)
      end
    else
      IO.puts("""
        You lose!
        The correct answer was '#{answer}'
      """)
    end
  end

  def calculate_guess(answer_list, user_input) do
    user_input =
      check_green(answer_list, user_input)
      check_yellow(answer_list, user_input)
      check_grey(answer_list, user_input)
  end

  def check_green(answer_list, user_input) do
    Enum.zip(answer_list, user_input)
    |> Enum.map(fn {a, u} ->
      if a == u do
        :green
      else
        u
      end
    end)
  end

  @spec check_yellow(any(), any()) :: any()
  def check_yellow(answer_list, user_input) do
    {_, output} =
      user_input
      |> Enum.reduce({answer_list, []}, fn u, {updated_answer_list, output_list} ->
        if u in updated_answer_list do
          {List.delete(updated_answer_list, u), output_list ++ [:yellow]}
        else
          {updated_answer_list, output_list ++ [u]}
        end
      end)

    output
  end

  def check_grey(_answer_list, user_input) do
    Enum.map(user_input, fn u ->
      # Default any non-green / yellow items to :grey
      if is_atom(u) do
        u
      else
        :grey
      end
    end)
  end

  def parse_string(string) do
    string
    |> String.trim()
    |> String.downcase()
    |> String.split("", trim: true)
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
