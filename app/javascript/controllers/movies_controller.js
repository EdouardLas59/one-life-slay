import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="movies"
export default class extends Controller {
  connect() {
    console.log("movie");
    
  }
}
