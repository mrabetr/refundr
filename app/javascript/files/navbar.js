const hamburgerHider = () => {
  const menu = document.querySelector('#menu');
  const hamburger = document.querySelector('#hamburger');
  const everything = document.querySelector('#everything');

  hamburger.addEventListener('click', (event) => {
    menu.style.width = "200px";
  });
  everything.addEventListener('click', (event) => {
    if (menu.style.width == "200px") {
      menu.style.width = "0px";
    };
  })  
}

const activePage = () => {
  const currentLocation = location.href
  const navbar = document.getElementById("nav-menu")
  const menuItem = navbar.querySelectorAll("a");
  for (let i = 0; i < menuItem.length; i++) {
    if (menuItem[i].href === currentLocation){
      menuItem[i].className = "active"
    }
  }
}

export { activePage };
export { hamburgerHider };