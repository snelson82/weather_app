# WeatherApp

Using the MetaWeather API and Elixir (<https://www.metaweather.com/api/>) this app finds the average max temperature in Salt Lake City, Los Angeles, and Boise for a 6-day forecast (API calls are made asynchronously).

## Installation

- Install dependencies
  - `mix deps.get`
- Load IEX console
  - `iex -S mix`
- Run the application via `WeatherApp.generate_average_max_temps`
- Example output

      Boise Average Max Temp: 42.1
      Los Angeles Average Max Temp: 68.36
      Salt Lake City Average Max Temp: 40.46
