const menu = document.querySelector('#menu');
const hamburger = document.querySelector('#hamburger')
const everything = document.querySelector('#everything')

const hamburgerHider = () => {
  hamburger.addEventListener('click', (event) => {
    menu.style.display = "block";
  });
  everything.addEventListener('click', (event) => {
    if (menu.style.display == "block") {
      menu.style.display = "none"
    };
  })  
}

export { hamburgerHider };