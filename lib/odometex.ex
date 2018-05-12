defmodule Odometex do
  @moduledoc """
  Provides simple comparisons with global references given a distance.
  """

  alias Odometex.Calculator

  @compare_default_options %{order: :best_match, limit: 5}

  @doc """
  Returns a list of results with the number of times of each one.

  It could take some options:
    - order:   You can use three different orders:
      - best_match: Returns the results such distance comparison (times) tends to 1.
      - asc: Returns the results given the shortest distances that we have as references.
      - desc: Returns the results given the longest distances that we have as references.
    - limit: The number of results to retunr. Default 5.

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

    iex> Odometex.compare(20, order: :desc, limit: 1)
    [
      %Odometex.Result{label: "Great Wall", meters: 8851000, times: 2.0e-6}
    ]
  """
  def compare(distance, options \\ []) do
    merged_options = Enum.into(options, @compare_default_options)
    Calculator.distances_with_times(distance, merged_options)
  end
end
