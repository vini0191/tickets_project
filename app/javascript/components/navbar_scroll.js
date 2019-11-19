const navbarScroll = () => {
  const navbar = document.querySelector(".navbar-lewagon");
  window.addEventListener("scroll", (event) => {
    if (window.scrollY >= 15) {
      navbar.classList.add("navbar-appear")
    } else {
      navbar.classList.remove("navbar-appear")
    }
  })
};

export default navbarScroll;
