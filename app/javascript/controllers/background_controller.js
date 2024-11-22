import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="background"
export default class extends Controller {
  connect() {

    var bodyElement = document.body;
    bodyElement.classList.add('animation')
    var speed = 1; // Vitesse du défilement
    var scale = 1; // Facteur de mise à l'échelle de l'image

    // Sélectionner l'élément body pour l'arrière-plan animé
    var x = 0; // Position de départ du défilement

    // Fonction qui gère l'animation de l'image en fond
    function animateBackground() {
      // Mettre à jour la position du background
      bodyElement.style.backgroundPositionX = x + 'px';

      // Modifier la position pour créer l'effet de défilement
      x -= speed;

      // Si l'image a complètement défilé, recommencer
      if (x <= -bodyElement.offsetWidth) {
        x = 0;
      }
    }

    // Appliquer l'image en fond et démarrer l'animation
    bodyElement.style.backgroundRepeat = 'repeat-x'; // Répéter l'image horizontalement
    bodyElement.style.backgroundSize = "contain";
    bodyElement.style.backgroundAttachment = 'fixed'; // L'image reste fixe lors du défilement de la page
    setInterval(animateBackground, 50);

  }
}
