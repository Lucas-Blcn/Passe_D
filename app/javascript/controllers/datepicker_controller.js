import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    console.log("Hello from pickr");
    flatpickr(this.element)
  }
}
