// import Rails from '@rails/ujs'
require('dotenv').config();
// const API_KEY = '863b7392659416101d42763dbe9d6af4';
const API_KEY = process.env.WEATHER_API;

// const spinner = document.getElementById('spinner');
// const weather = document.getElementById('weather');
const icon = document.getElementById('icon');
const temperature = document.getElementById('temperature');
// const description = document.getElementById('description');
const city = document.getElementById('city');
const country = document.getElementById('country');


const updateCard = (data) => {
  // weather.classList.remove('hidden');
  // spinner.classList.add('hidden');
  // icon.src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`;
  // temperature.innerText = `${Math.round(data.main.temp) - 273}°C`;
  // description.innerText = data.weather[0].description;
  // city.innerText = data.name;
  // country.innerText = data.sys.country;

  // let temp_data = new FormData()
  let temp_data = `${Math.round(data.main.temp) - 273}°C`
  let city_data = data.name
  let country_data = data.sys.country
  let icon_data = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`
  // temp_data.append('temperature', `${Math.round(data.main.temp) - 273}°C`)
  // city_data.append('city', data.name)
  // country_data.append('country', data.sys.country)
  $.ajax({
    type: "POST",
    url:  "/weather",
    data: {
            temp_data: temp_data,
            city_data: city_data,
            country_data: country_data,
            icon_data: icon_data
          }
        })
  // Rails.ajax({
  //   url: '/weather', type: 'POST', data: temp_data
  //   }
  // })
};

const fetchWeatherByCoordinates = (coordinates) => {
  fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${coordinates.lat}&lon=${coordinates.lon}&appid=${API_KEY}`)
    .then(response => response.json())
    .then(updateCard);
};

const fetchCurrentPositionWeather = () => {
  navigator.geolocation.getCurrentPosition((data) => {
    fetchWeatherByCoordinates({ lat: data.coords.latitude, lon: data.coords.longitude });
  });
};


export { fetchCurrentPositionWeather };
