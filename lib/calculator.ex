defmodule Odometex.Calculator do
  alias Odometex.Result

  @distances "#{__DIR__}/../config/distances.json"
    |> File.read!
    |> Poison.decode!(as: [%Result{}])

  def distances_with_times(distance, %{ order: :desc } = options) do
    distances_with_times(
      distance,
      fn(x, y) -> x.meters > y.meters end,
      options.limit
    )
  end

  def distances_with_times(distance, %{ order: :asc } = options) do
    distances_with_times(
      distance,
      fn(x, y) -> x.meters < y.meters end,
      options.limit
    )
  end

  def distances_with_times(distance, %{ order: :best_match } = options) do
    distances_with_times(
      distance,
      fn(x, y) -> abs(x.meters - distance) < abs(y.meters - distance) end,
      options.limit
    )
  end

  defp distances_with_times(distance, sort_func, limit) do
    @distances
    |> Enum.map(
      fn(item) -> %{item | times: times_value(item, distance)} end
    )
    |> Enum.sort(sort_func)
    |> Enum.take(limit)

  end

  defp times_value(item, distance) do
    distance / item.meters |> Float.round(6)
  end
end
