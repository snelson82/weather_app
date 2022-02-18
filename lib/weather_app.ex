defmodule WeatherApp do
  @moduledoc """
  This is the code assessment challenge for TravelPass Group Engineering

  Using the MetaWeather API (https://www.metaweather.com/api/), find the average max temperature in Salt Lake City, Los Angeles, and Boise
  for a 6-day forecast
    - In Elixir, start a new mix project (mix new project_name)
    - Make these API calls concurrently (you could spawn new processes, use Tasks, or Genservers)
      - We’re looking to see how you use Elixir and specifically some of it’s functional coding features
    - Use software best practices while documenting and testing your code to a reasonable extent
    - Consider mocking the Metaweather API for testing

  - According to the MetaWeather API each one of these API calls will return a field called "consolidated_weather"
  - It contains a weather forecast for the city for each day including today and the next 5 days
  - Each forecast includes a field called "max_temp" that is the max temperature for that forecasted day
  - Find the average of max_temp for all forecasts for the city
  """

  @doc """
  Retrieves weather data for three locations, then outputs the average maximum temperature (in Fahrenheit) for each location

  ## Examples

  Boise Average Max Temp: 42.1
  Los Angeles Average Max Temp: 68.36
  Salt Lake City Average Max Temp: 40.46

  """
  def hello do
    :world
  end
end
