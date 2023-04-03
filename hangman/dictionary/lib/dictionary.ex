defmodule Dictionary do
  @moduledoc """
  Documentation for `Dictionary`.
  """

  @doc """
  Word list.

  """
  def word_list do
    eg = File.read!("assets/words.txt")
    String.split(eg, ~r/\n/, trim: true)
  end

  def random_word do
    Enum.random(word_list())
  end
end
