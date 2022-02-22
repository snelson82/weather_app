defmodule WeatherAppTest do
  use ExUnit.Case, async: false
  doctest WeatherApp

  test "should return output of successful metaweather location API fetch for cities supplied and output error message for nonexistent locations" do
    assert WeatherApp.max_temp_generate([
             "2366355",
             "2442047",
             "2487610",
             "796018275075026"
           ]),
           do: :ok
  end
end
