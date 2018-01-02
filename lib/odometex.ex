defmodule Odometex do
  @moduledoc """
  Documentation for Odometex.
  """

  alias Odometex.Calculator

  @doc """
  Hello world.

  ## Examples

      iex> Odometex.compare(42195)
      [%{ "label": "Marathon", "meters": 42195, "times": 1}]

  """
  def compare(distance) do
    Calculator.distances_with_times(distance)
  end
end
