defmodule WordleTest do
  use ExUnit.Case

  # Games.Wordle.play(//answer, //user_input)
  test "play/2" do
    # If guess is correct:
    # assert Games.Wordle.play("beats", "beats") == :ok, [:green, :green, :green, :green, :green]
    assert Games.Wordle.play("beats", "beats") == [:green, :green, :green, :green, :green]
  end
end
