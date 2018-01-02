defmodule Odometex.Calculator do
  @distances File.read!("#{__DIR__}/../config/distances.json") |> Poison.Parser.parse!

  def distances_with_times(distance) do
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
