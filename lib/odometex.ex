defmodule Odometex do
  @moduledoc """
  Documentation for Odometex.
  """

  alias Odometex.Calculator

  @doc """
  Returns a list of distances

  ## Examples

      iex> Odometex.compare(42195)
      [%{ "label": "Marathon", "meters": 42195, "times": 1}]

  """
  def compare(distance, options \\ %{order: :best_match}) do
    Calculator.distances_with_times(distance, options)
  end
end
