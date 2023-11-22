// import { Controller } from "@hotwired/stimulus"
// import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

// export default class extends Controller {
//   connect() {
//     console.log("Hello from pickr");
//     flatpickr(this.element)
//   }
// }

import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ['startDateInput', 'endDateInput']

  connect() {
    // this.initializeStartDatePicker();
    this.initializeEndDatePicker();
  }

  // initializeStartDatePicker() {
  //   flatpickr(this.startDateInputTarget, {
  //     altInput:   true,
  //     minDate:    "today",
  //     altFormat:  "F j, Y",
  //     dateFormat: "Y-m-d",
  //   });
  // }

  initializeEndDatePicker() {
    flatpickr(this.endDateInputTarget, {
      altInput:   true,
      minDate:    "today", // Set the minDate dynamically
      mode: "range",
      altFormat:  "F j, Y",
      dateFormat: "Y-m-d",
    });
  }
}
