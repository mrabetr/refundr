const API_KEY = '863b7392659416101d42763dbe9d6af4';

const spinner = document.getElementById('spinner');
const weather = document.getElementById('weather');
const icon = document.getElementById('icon');
const temperature = document.getElementById('temperature');
// const description = document.getElementById('description');
const city = document.getElementById('city');
const country = document.getElementById('country');

const updateCard = (data) => {
  weather.classList.remove('hidden');
  spinner.classList.add('hidden');
  icon.src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`;
  temperature.innerText = `${Math.round(data.main.temp) - 273}°C`;
  // description.innerText = data.weather[0].description;
  city.innerText = data.name;
  country.innerText = data.sys.country;
};

const fetchWeatherByCoordinates = (coordinates) => {
  fetch(`http://api.openweathermap.org/data/2.5/weather?lat=${coordinates.lat}&lon=${coordinates.lon}&appid=${API_KEY}`)
    .then(response => response.json())
    .then(updateCard);
};

const fetchCurrentPositionWeather = () => {
  navigator.geolocation.getCurrentPosition((data) => {
    fetchWeatherByCoordinates({ lat: data.coords.latitude, lon: data.coords.longitude });
  });
};

export { fetchCurrentPositionWeather };