document.addEventListener("DOMContentLoaded", () => {
const scrollBtn = document.getElementById("retourTop");

window.addEventListener("scroll", () => {

  if (window.scrollY > 100) {
    scrollBtn.style.display = "block"; // Montre le bouton
  } else {
    scrollBtn.style.display = "none";  // Cache le bouton
  }
});

scrollBtn.addEventListener("click", () => {
  window.scrollTo({
    top: 0,              // remonte tout en haut
    behavior: "smooth"   // effet doux
  });
});
});