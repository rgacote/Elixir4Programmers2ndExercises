defmodule Dictionary do
  @moduledoc """
  Documentation for `Dictionary`.
  """

  # This is a compile-time code execution.
  # assets/words not dynamically loadable at run time.
  @word_list "assets/words.txt"
             |> File.read!()
             |> String.split(~r/\n/, trim: true)

  @doc """
  Word list.

  """
  def word_list do
    @word_list
  end

  def random_word do
    word_list()
    |> Enum.random()
  end
end
