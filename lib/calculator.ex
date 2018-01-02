defmodule Odometex.Calculator do
  @distances "#{__DIR__}/../config/distances.json" |> File.read! |> Poison.Parser.parse!

  def distances_with_times(distance, %{ order: :desc } = options) do
    distances_with_times(distance)
    |> Enum.sort(fn(x, y) -> x["meters"] > y["meters"] end)
    |> Enum.take(options[:limit])

  end

  def distances_with_times(distance, %{ order: :asc } = options) do
    distances_with_times(distance)
    |> Enum.sort(fn(x, y) -> x["meters"] < y["meters"] end)
    |> Enum.take(options[:limit])
  end

  def distances_with_times(distance, %{ order: :best_match } = options) do
    distances_with_times(distance)
    |> Enum.sort(
      fn(x, y) ->
        abs(x["meters"] - distance) < abs(y["meters"] - distance)
      end
    )
    |> Enum.take(options[:limit])
  end

  defp distances_with_times(distance) do
    @distances
    |> Enum.map(
      fn(item) -> item|> Map.put("times", item|> times_value(distance)) end
    )
  end

  defp times_value(item, distance) do
    original_distance = item |> Map.fetch!("meters")
    distance / original_distance |> Float.round(6)
  end
end
