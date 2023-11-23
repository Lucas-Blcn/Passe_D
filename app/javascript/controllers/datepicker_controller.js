import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ['endDateInput', 'productPrice'];

  connect() {
    this.initializeEndDatePicker();
  }

  initializeEndDatePicker() {
    flatpickr(this.endDateInputTarget, {
      altInput:   true,
      minDate:    "today", // Set the minDate dynamically, dates before are disabled
      mode: "range", // to be able to select a range of date
      altFormat:  "d/m/Y",
      dateFormat: "Y-m-d",
    });
  }

  updatePrice() {
    // Mettre le prix de la location à jour
      // Connaître le nombre total de jour de location
      const numberOfDays = this.nbjour();
      // Connaître le prix du produit par jour
      const priceText = this.productPriceTarget.textContent;
      const priceValue = parseFloat(priceText.replace('€/j', ''));
      // Multiplier nb jour par le prix par jour
      return ( `${numberOfDays}` * `${priceValue}€`);


  }

  nbjour(){
    const element = document.getElementById("endingDate").value
      let arr = element.split(' to ');

      if (arr.length === 2) {
        const starting_date = arr[0];
        const ending_date = arr[1];

        // Diviser les chaînes en jour, mois et année
        const [start_day, start_month, start_year] = starting_date.split('/');
        const [end_day, end_month, end_year] = ending_date.split('/');

        const dateObjectStartDay = new Date(`${start_year}-${start_month}-${start_day}`);
        const dateObjectEndDay = new Date(`${end_year}-${end_month}-${end_day}`);

        const days_between_dates = Math.floor((dateObjectEndDay - dateObjectStartDay) / (1000* 60*60*24) ) + 1
        console.log(`Nombre de jours de location : ${days_between_dates}`);
        return Number(days_between_dates);
      } else {
        return 1;
      };

  }


}
