// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import * as bootstrap from "bootstrap";
//= require select2
const BASE_RECEIVERS_URL = "http://localhost:3000/receivers/";
if (window.location.pathname == "/discards/new") {
  document
    .getElementById("discard_receiver_id")
    .addEventListener("change", function (ev) {
      if (ev.target.value) {
        fetch(BASE_RECEIVERS_URL + ev.target.value + "/residues")
          .then((response) => {
            console.log(response.body.json);
          })
          .then((data) => {});
      }
    });
}

$(document).ready(function () {
  $(".select2").select2();
});
