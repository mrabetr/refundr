// const stickyNavbar = () => {
//   const navbar = document.querySelector("#navbar");
//   const sticky = navbar.offsetTop;

//   navbar.addEventListener('scroll', (event) => {
//     if (window.pageYOffset >= sticky) {
//     navbar.classList.add("sticky")
//     } else {
//     navbar.classList.remove("sticky");
//     };
//   })
// }

const hamburgerHider = () => {
  const menu = document.querySelector('#menu');
  const hamburger = document.querySelector('#hamburger');
  const everything = document.querySelector('#everything');

  hamburger.addEventListener('click', (event) => {
    menu.style.width = "200px";
    menu.style.borderRight = "1px solid rgba(0, 0, 0, 0.2)";
  });
  everything.addEventListener('click', (event) => {
    if (menu.style.width == "200px") {
      menu.style.width = "0px";
      menu.style.borderRight = "1px solid rgba(0, 0, 0, 0)";
    };
  })  
}



const activePage = () => {
  const currentLocation = location.href
  const navbar = document.getElementById("nav-menu")
  const menuItem = navbar.querySelectorAll("a");
  for (let i = 0; i < menuItem.length; i++) {
    if (menuItem[i].href === currentLocation){
      menuItem[i].className = "active1"
    }
  }
}

export { activePage };
export { hamburgerHider };