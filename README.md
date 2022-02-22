# WeatherApp

Using the MetaWeather API and Elixir (<https://www.metaweather.com/api/>) this app finds the average max temperature in Salt Lake City, Los Angeles, and Boise for a 6-day forecast (API calls are made asynchronously).

## Installation

- Install dependencies
  - `mix deps.get`
- Load IEX console
  - `iex -S mix`
- Run the application via `WeatherApp.forecast_summary`
- Example output

      => Location "Not A Real Place" not found!
      Los Angeles Average Max Temp: 67.49
      Boise Average Max Temp: 33.99
      Salt Lake City Average Max Temp: 32.83

## Testing

Tests, including a mock of metaweather's API, have been added to ensure accurate output and valid metaweather API location endpoints (unlike the `Not A Real Place` example location).

To run the test, simply run `mix test`
