# WeatherApp

Using the MetaWeather API and Elixir (<https://www.metaweather.com/api/>) this app finds the average max temperature in Salt Lake City, Los Angeles, and Boise for a 6-day forecast (API calls are made asynchronously).

## Installation

- Install dependencies
  - `mix deps.get`
- Load IEX console
  - `iex -S mix`
- Run the application via `WeatherApp.max_temp_generate(["2366355", "2442047", "2487610"])`
- Example output

      Los Angeles Average Max Temp: 67.49
      Boise Average Max Temp: 33.99
      Salt Lake City Average Max Temp: 32.83

## Testing

Tests have been added to ensure accurate output and valid metaweather API location endpoints. Each location ID passed will either output averaged max temperature data or alert to nonexistent locations.

To run the test, simply run `mix test`
