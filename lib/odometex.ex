defmodule Odometex do
  @moduledoc """
  Documentation for Odometex.
  """

  alias Odometex.Calculator

  @compare_default_options %{order: :best_match, limit: 5}

  @doc """
  Returns a list of results with the number of times of each one

  ## Examples

    iex> Odometex.compare(20)
    [
      %Odometex.Result{label: "Bowling lane", meters: 19, times: 1.052632},
      %Odometex.Result{label: "Blue Whale (female)", meters: 25, times: 0.8},
      %Odometex.Result{label: "Basketball court", meters: 28, times: 0.714286},
      %Odometex.Result{label: "Football pitch", meters: 105, times: 0.190476},
      %Odometex.Result{
        label: "Passeig de Gràcia, Barcelona",
        meters: 1300,
        times: 0.015385
      }
    ]
  """
  def compare(distance, options \\ []) do
    merged_options = Enum.into(options, @compare_default_options)
    Calculator.distances_with_times(distance, merged_options)
  end
end
