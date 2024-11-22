import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price"
export default class extends Controller {
  connect() {


      const priceRange = document.getElementById('priceRange');
      const priceValue = document.getElementById('priceValue');

      priceRange.addEventListener('change', () => {
        priceValue.textContent = priceRange.value + ' €';
      });
  }
}
