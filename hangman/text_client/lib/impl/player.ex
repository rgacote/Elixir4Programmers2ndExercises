defmodule TextClient.Impl.Player do
  @typep game :: Hangman.game()
  @typep tally :: Hangman.Impl.Game.tally()
  @typep state :: {game, tally}

  @spec start(game) :: :ok
  def start(game) do
    tally = Hangman.tally(game)
    interact({game, tally})
  end

  @spec interact(state) :: :ok

  def interact({_game, tally = %{game_state: :won}}) do
    IO.puts("Congratulations. You found the word: #{tally.letters |> Enum.join()}")
  end

  def interact({_game, tally = %{game_state: :lost}}) do
    IO.puts("Sorry, you lost... the word was #{tally.letters |> Enum.join()}")
  end

  def interact({game, tally}) do
    IO.puts(feedback_for(tally))
    IO.puts(current_word(tally))

    tally = Hangman.make_move(game, get_guess())
    interact({game, tally})
  end

  @spec feedback_for(tally) :: String.t()
  defp feedback_for(tally = %{game_state: :initializing}) do
    "I'm thinking of a word with #{tally.letters |> length} letters."
  end

  defp feedback_for(_tally = %{game_state: :good_guess}), do: "Good guess!"

  defp feedback_for(_tally = %{game_state: :bad_guess}), do: "Bad guess!"

  defp feedback_for(_tally = %{game_state: :already_used}), do: "Already used!"

  defp current_word(tally) do
    [
      "Word so far: ",
      tally.letters |> Enum.join(" "),
      "   turns left #{tally.turns_left}.",
      "   used so far: ",
      tally.used |> Enum.join(",")
    ]
  end

  @spec get_guess :: String.t()
  defp get_guess() do
    IO.gets("Guess a letter: ")
    |> String.trim()
    |> String.downcase()
  end
end
