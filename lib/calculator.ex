defmodule Odometex.Calculator do
  @distances File.read!("#{__DIR__}/../config/distances.json") |> Poison.Parser.parse!

  def distances_with_times(distance, %{ order: :desc }) do
    distances_with_times(distance)
    |> Enum.sort(fn(x, y) -> x["meters"] > y["meters"] end)
  end

  def distances_with_times(distance, %{ order: :asc }) do
    distances_with_times(distance)
    |> Enum.sort(fn(x, y) -> x["meters"] < y["meters"] end)
  end

  def distances_with_times(distance, %{ order: :best_match }) do
    distances_with_times(distance)
    |> Enum.sort(
      fn(x, y) ->
        abs(x["meters"] - distance) < abs(y["meters"] - distance)
      end
    )
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
