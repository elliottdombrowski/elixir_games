defmodule WordleTest do
  use ExUnit.Case

  # Games.Wordle.play(//answer, //user_input)
  test "All green:" do
    assert Games.Wordle.calculate_guess(["a", "a", "a", "a", "a"], ["a", "a", "a", "a", "a"]) == [:green, :green, :green, :green, :green]
  end

  test "All grey:" do
    assert Games.Wordle.calculate_guess(["a", "a", "a", "a", "a"], ["b", "b", "b", "b", "b"]) == [:grey, :grey, :grey, :grey, :grey]
  end

  test "One green:" do
    assert Games.Wordle.calculate_guess(["a", "a", "a", "a", "a"], ["a", "b", "b", "b", "b"]) == [:green, :grey, :grey, :grey, :grey]
  end

  test "Parse answer / input:" do
    assert Games.Wordle.parse_string("beats") == ["b", "e", "a", "t", "s"]
    assert Games.Wordle.parse_string("Beats") == ["b", "e", "a", "t", "s"]
    assert Games.Wordle.parse_string("Beats ") == ["b", "e", "a", "t", "s"]
  end

  test "Check Green" do
    assert Games.Wordle.check_green(["a", "b", "b", "b", "b"], ["a", "a", "a", "a", "a"]) == [:green, "b", "b", "b", "b"]
    assert Games.Wordle.check_green(["a", "a", "a", "a", "a"], ["a", "b", "b", "b", "b"]) == [:green, "a", "a", "a", "a"]
    assert Games.Wordle.check_green(["c", "c", "a", "c", "c"], ["a", "b", "b", "b", "b"]) == ["c", "c", "a", "c", "c"]
    assert Games.Wordle.check_green(["a", "b", "a", "b", "b"], ["a", "a", "a", "a", "a"]) == [:green, "b", :green, "b", "b"]
    assert Games.Wordle.check_green(["a", "a", "a", "a", "a"], ["a", "a", "a", "a", "a"]) == [:green, :green, :green, :green, :green]
  end

  test "Check Yellow" do
    assert Games.Wordle.check_yellow(["d", "c", "a", "c", "c"], ["a", "b", "b", "b", "b"]) == ["d", "c", :yellow, "c", "c"]
    assert Games.Wordle.check_yellow(["c", "c", "a", "c", "c"], ["a", "b", "b", "b", "b"]) == ["c", "c", :yellow, "c", "c"]
    assert Games.Wordle.check_yellow(["c", "c", "a", "a", "c"], ["a", "b", "b", "b", "b"]) == ["c", "c", :yellow, "a", "c"]
    assert Games.Wordle.check_yellow(["c", "c", "a", "a", "c"], ["a", "b", "b", "b", "a"]) == ["c", "c", :yellow, :yellow, "c"]
    assert Games.Wordle.check_yellow([:green, "c", "a", "a", "c"], ["a", "b", "b", "b", "a"]) == [:green, "c", :yellow, :yellow, "c"]
  end

  test "Check Gray" do
    assert Games.Wordle.check_grey(["b", "b", "b", "b", "b"], nil) == [:grey, :grey, :grey, :grey, :grey]
    assert Games.Wordle.check_grey([:green, "b", :green, "b", "b"], nil) == [:green, :grey, :green, :grey, :grey]
    assert Games.Wordle.check_grey([:green, "b", :yellow, "b", "b"], nil) == [:green, :grey, :yellow, :grey, :grey]
  end
end
