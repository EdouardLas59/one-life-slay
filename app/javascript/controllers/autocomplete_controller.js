import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autocomplete"
export default class extends Controller {
  connect() {
    console.log("connected")

//     const url = "http://tmdb.lewagon.com/movie/top_rated";

// fetch(url)
//   .then(response => response.json())
//   .then(data => {
//     console.log(data);
//   })

 }
}
