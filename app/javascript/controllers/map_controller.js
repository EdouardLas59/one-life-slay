import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Array,
    user: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue


    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/navigation-night-v1",
      center: [3.066667, 50.633333],
      zoom: 10
    })

    this.#addMarkerToMap()
    this.#fitMapToMarkers()


    this.map.on('click', (event) => {


      // console.log("click", event.lngLat)
      // console.log("marker", this.markerValue[0])
      const lat = event.lngLat.lat
      const lng = event.lngLat.lng

      const pickupPlaceField = document.getElementById("booking_pickup_place")
      if (pickupPlaceField) {
        pickupPlaceField.value = JSON.stringify({ lat, lng })
      }
      this.#getAddressFromCoordinates(lat, lng)
    })

  }

    #addMarkerToMap() {
      new mapboxgl.Marker({color: "#FF204E"})
      .setLngLat([this.userValue.lng, this.userValue.lat])
      .addTo(this.map)


      this.markerValue.forEach(marker => {
        const popup = new mapboxgl.Popup({ offset: 25 })
        // .setHTML(marker.info_window_html)
        const mapMarker = new mapboxgl.Marker({ color: "#5D0E41" })
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(this.map);


      });
    }


    #fitMapToMarkers() {
      const bounds = new mapboxgl.LngLatBounds()

      this.markerValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))

      bounds.extend([this.userValue.lng, this.userValue.lat])

      this.map.fitBounds(bounds, { padding: 70, maxZoom: 35, duration: 0 })
    }


  async #getAddressFromCoordinates(lat, lng) {
    const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${lng},${lat}.json?access_token=${mapboxgl.accessToken}&language=fr`

    try {
      const response = await fetch(url)
      const data = await response.json()

      if (data.features && data.features.length > 0) {
        const address = data.features[0].place_name
        this.#displayAddress(address)
      } else {
        console.error("Aucune adresse trouvée.")
        this.#displayAddress("Adresse non trouvée.")
      }
    } catch (error) {
      console.error("Erreur lors du géocodage inverse : ", error)
      this.#displayAddress("Erreur de géocodage.")
    }
  }

  // Afficher l'adresse dans l'interface utilisateur
  #displayAddress(address) {
    const addressField = document.getElementById("address-display")
    if (addressField) {
      addressField.textContent = address
    }
  }


}
