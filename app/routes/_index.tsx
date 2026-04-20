import { json } from '@remix-run/node'
import { useLoaderData } from '@remix-run/react'
import type { LoaderFunctionArgs } from '@remix-run/node'

import { fetchWeatherData } from '../api-services/open-weather-service'

export async function loader({ request }: LoaderFunctionArgs) {
  const lat = 45.3211
  const lon = -75.7391
  const units = 'metric'

  try {
    const data = await fetchWeatherData({ lat, lon, units })
    return json({
      currentConditions: data,
      error: null,
      locationName: 'Algonquin College, Woodroffe Campus',
      lat,
      lon,
    })
  } catch (err: any) {
    return json({
      currentConditions: null,
      error: err?.message ?? 'Failed to load weather data',
      locationName: 'Algonquin College, Woodroffe Campus',
      lat,
      lon,
    })
  }
}

export default function CurrentConditions() {
  const { currentConditions, error, locationName, lat, lon } =
    useLoaderData<typeof loader>()

  if (error) {
    return (
      <main
        style={{
          padding: '1.5rem',
          fontFamily: 'system-ui, sans-serif',
          lineHeight: '1.8',
        }}
      >
        <h1>Weather App</h1>
        <p style={{ color: 'crimson' }}>Error: {error}</p>
        <p>
          Check that <code>WEATHER_API_KEY</code> is set and valid, and that Redis is running.
        </p>
      </main>
    )
  }

  if (!currentConditions) {
    return (
      <main
        style={{
          padding: '1.5rem',
          fontFamily: 'system-ui, sans-serif',
          lineHeight: '1.8',
        }}
      >
        <h1>Weather App</h1>
        <p>Loading...</p>
      </main>
    )
  }

  const weather = currentConditions?.weather?.[0]
  const temp = currentConditions?.main?.temp
  const feelsLike = currentConditions?.main?.feels_like
  const iconCode = weather?.icon
  const iconUrl = iconCode
    ? `https://openweathermap.org/img/wn/${iconCode}@2x.png`
    : null

  const updatedAt = currentConditions?.dt
    ? new Date(currentConditions.dt * 1000).toLocaleString()
    : 'Unknown'

  return (
    <main
      style={{
        padding: '1.5rem',
        fontFamily: 'system-ui, sans-serif',
        lineHeight: '1.8',
      }}
    >
      <h1 style={{ fontSize: '3rem', marginBottom: '2rem' }}>Remix Weather</h1>

      <p style={{ fontSize: '1.2rem', marginBottom: '0.5rem' }}>
        For {locationName}
      </p>

      <p style={{ color: '#7a88b8', marginTop: 0, marginBottom: '2rem' }}>
        (LAT: {lat}, LON: {lon})
      </p>

      <h2 style={{ fontSize: '2rem', marginBottom: '1.5rem' }}>
        Current Conditions
      </h2>

      {!weather ? (
        <p>Weather data unavailable.</p>
      ) : (
        <>
          <div
            style={{
              display: 'flex',
              alignItems: 'center',
              gap: '1rem',
              marginBottom: '1.5rem',
            }}
          >
            {iconUrl ? (
              <img
                src={iconUrl}
                alt={weather.description}
                style={{ width: '80px', height: '80px' }}
              />
            ) : null}

            <div style={{ fontSize: '3rem', fontWeight: 500 }}>
              {typeof temp === 'number' ? `${temp.toFixed(1)}°C` : 'N/A'}
            </div>
          </div>

          <p style={{ fontSize: '1.2rem', marginBottom: '0.75rem' }}>
            {weather.description.charAt(0).toUpperCase() +
              weather.description.slice(1)}
            {typeof feelsLike === 'number'
              ? `. Feels like ${feelsLike.toFixed(1)}°C.`
              : '.'}
          </p>

          <p style={{ color: '#7a88b8', marginBottom: '2rem' }}>
            updated at {updatedAt}
          </p>
        </>
      )}

      <section
        style={{
          backgroundColor: '#eef2f8',
          padding: '1.5rem',
          borderRadius: '6px',
        }}
      >
        <h2 style={{ fontSize: '2rem', marginTop: 0 }}>Raw Data</h2>
        <pre
          style={{
            whiteSpace: 'pre-wrap',
            wordBreak: 'break-word',
            fontSize: '1rem',
            lineHeight: '1.5',
          }}
        >
          {JSON.stringify(currentConditions, null, 2)}
        </pre>
      </section>
    </main>
  )
}