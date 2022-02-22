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

  @doc ~S"""
  Retrieves weather data for three locations, then outputs the average maximum temperature (in Fahrenheit) for each location

  ## Examples

  iex> WeatherApp.max_temp_generate(["2366355", "2442047", "2487610"])

  Salt Lake City Average Max Temp: 38.92
  Boise Average Max Temp: 39.75
  Los Angeles Average Max Temp: 65.67
  """

  # Initial portion of API URL
  @base_api_url :"https://www.metaweather.com/api/location/"

  ############
  #  PUBLIC  #
  ############

  # Sets up async work to iterate over each a map of cities provided, %{"city name": "location_id"}

  @spec max_temp_generate(any) :: list
  def max_temp_generate(cities) do
    Enum.map(cities, fn location_id ->
      Task.async(fn -> fetch_api_data(location_id) end)
    end)
    |> Enum.map(fn task -> Task.await(task) end)
  end

  #############
  #  PRIVATE  #
  #############

  # Gathers weather API data (JSON) for a given location
  defp fetch_api_data(location_id) do
    case HTTPoison.get("#{@base_api_url}#{location_id}", [], follow_redirect: true) do
      # successful fetch
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Jason.decode!()
        |> response_handler()

      # location not found
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("=> Location \"#{location_id}\" not found!")

      # error
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end

  # Combines list values for single sum
  defp list_sum(list), do: Enum.reduce(list, 0, &(&1 + &2))

  # Average for list of floats
  defp list_average(floaters), do: list_sum(floaters) / Enum.count(floaters)

  # Converts Celsius temperatures to Fahrenheit
  defp fahrenheit_conversion(temperature), do: temperature * 9 / 5 + 32

  # Rounds float to be double precision
  defp float_rounder(val), do: round(val * 100) / 100

  # STDOUT output for locations and their average max temperature
  defp average_max_temperature_output(average_max_temperature, name) do
    IO.puts("#{name} Average Max Temp: #{average_max_temperature}")
  end

  # Generates 6-day average max temperature as double precision float (Fahrenheit) and sends value to output function
  defp response_handler(api_response) do
    api_response["consolidated_weather"]
    |> get_in([Access.all(), "max_temp"])
    |> list_average()
    |> fahrenheit_conversion()
    |> float_rounder()
    |> average_max_temperature_output(api_response["title"])
  end
end
