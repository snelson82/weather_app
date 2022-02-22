defmodule WeatherAppTest do
  use ExUnit.Case, async: false
  doctest WeatherApp

  test "should successfully reach metaweather's API endpoint for Salt Lake City (location_id, '2487610')" do
    assert WeatherApp.generate_average_max_temps(%{"Salt Lake City": "2487610"}), do: :ok
  end
end
