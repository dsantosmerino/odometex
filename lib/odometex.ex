defmodule Odometex do
  @moduledoc """
  Documentation for Odometex.
  """

  alias Odometex.Calculator

  @compare_default_options %{order: :best_match, limit: 20}

  @doc """
  Returns a list of distances

  ## Examples

      iex> Odometex.compare(42195)
      [%{ "label": "Marathon", "meters": 42195, "times": 1}]

  """
  def compare(distance, options \\ []) do
    merged_options = Enum.into(options, @compare_default_options)
    Calculator.distances_with_times(distance, merged_options)
  end
end
