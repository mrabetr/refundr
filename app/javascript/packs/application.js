// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("jquery")
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
//= require parallax
//= require jquery.parallax

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { hamburgerHider } from "../files/navbar";
import { activePage } from "../files/navbar";
import { addItems } from "../files/receiptItemForm";
import { removeField } from "../files/receiptItemForm";
// Internal imports, e.g:
import { fetchCurrentPositionWeather } from '../files/weather';
import { loadDynamicBannerText } from '../plugins/home_banner';
import { initSelect2 } from '../plugins/init_select2';
import { previewImageOnFileSelect } from '../components/photo_preview';


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  removeField();
  hamburgerHider();
  activePage();
  addItems();
  fetchCurrentPositionWeather();
  if(document.querySelector('#banner-typed-text')) {
    loadDynamicBannerText();
  }
  if(document.querySelector(".pie_chart")) {
    const table = document.querySelector(".table");
    const tableHeight = parseFloat(getComputedStyle(table, null).height.replace("px", ""));
    console.log(tableHeight);
    const pieChart = document.querySelector(".header");
    let scrollTarget = 0;
    document.addEventListener('scroll', (event) => {
      // pieChart.style.top = `40px`;
      // table.style.top = `-${window.scrollY}px`;
      if(window.scrollY > (tableHeight - 180)) {
        console.log("working");
        window.scrollTo(0, scrollTarget);
      }
      else {
        scrollTarget = window.scrollY;
        console.log(scrollTarget);
      }
    })
  }
  if (document.querySelector(".select2")) {
    initSelect2();
  }
  previewImageOnFileSelect();
});


