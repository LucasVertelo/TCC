const menuHumbButton = document.querySelector(".menu-humb-button")
const navLinks = document.querySelector(".nav-links")
const menuOverlay = document.querySelector(".menu-overlay")

menuHumbButton.addEventListener("click", () => {
  menuHumbButton.classList.toggle("isOpen")
  navLinks.classList.toggle("show")
  menuOverlay.classList.toggle("show")
})

menuOverlay.addEventListener("click", () => {
  menuHumbButton.classList.remove("isOpen")
  navLinks.classList.remove("show")
  menuOverlay.classList.remove("show")
})