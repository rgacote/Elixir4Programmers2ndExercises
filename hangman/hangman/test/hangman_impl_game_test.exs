defmodule HangmanImplGameTest do
  use ExUnit.Case
  alias Hangman.Impl.Game

  test "new game returns structure" do
    game = Game.new_game()

    assert game.turns_left == 7
    assert game.game_state == :initializing

    assert length(game.letters) > 0
  end

  test "new game returns correct word" do
    game = Game.new_game("wombat")

    assert game.letters == ["w", "o", "m", "b", "a", "t"]
  end

  test "letters are all lowercase" do
    game = Game.new_game()

    game.letters
    |> Enum.map(fn x -> assert x == String.downcase(x) end)
  end
end
