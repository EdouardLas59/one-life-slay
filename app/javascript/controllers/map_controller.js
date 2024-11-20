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
      style: "mapbox://styles/mapbox/navigation-night-v1"

    })

    this.#addMarkerToMap()

    this.#fitMapToMarkers()
  }

  #addMarkerToMap() {
    new mapboxgl.Marker({color: "#FF204E"})
      .setLngLat([this.userValue.lng, this.userValue.lat])
      .addTo(this.map)

    this.markerValue.forEach(marker => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker({color: "#5D0E41"})
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
        .setPopup(popup)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()

    this.markerValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))


    bounds.extend([this.userValue.lng, this.userValue.lat])

    this.map.fitBounds(bounds, { padding: 70, maxZoom: 35, duration: 0 })
  }
}
