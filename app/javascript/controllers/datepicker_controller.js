import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()
import rangePlugin from "flatpickrRangePlugin";

export default class extends Controller {
  static targets = ["startDate", "endDate"]

  connect() {
    flatpickr(this.startDateTarget, {
      // Provide an id for the plugin to work
      plugins: [new rangePlugin({ input: "#date_end"})]})
      // "plugins": [new rangePlugin({ input: "#secondRangeInput"})]
    flatpickr(this.endDateTarget, {})
  }

}
