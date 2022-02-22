defmodule WeatherAppTest do
  use ExUnit.Case, async: false
  doctest WeatherApp

  test "should successfully reach metaweather's API endpoint for Salt Lake City (location_id, '2487610')" do
    assert WeatherApp.generate_average_max_temps(%{
             Boise: "2366355",
             "Los Angeles": "2442047",
             "Salt Lake City": "2487610",
             "Not A Real Place": "243875983216541268"
           }),
           do: :ok
  end
end
