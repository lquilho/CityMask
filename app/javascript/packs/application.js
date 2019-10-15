import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

// import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initAutocomplete } from '../plugins/init_autocomplete';

initMapbox();
initAutocomplete();



if(document.querySelector(".fixpoints.index")) {
  let toggleButton = document.querySelector("#toggle-list");
  let fixpointsList = document.querySelector("#fixpoints-list");
  let map = document.querySelector("#map");
  let toggleIcon = document.querySelector("#toggle-list i");
  // when the toggle is clicked
  // 1. remove d-none class from index
  // 2. add d-none to the map div
  // 3. change the class of the toggle button to on

  toggleButton.addEventListener("click", (event) => {
    // map.classList.add("d-none");
    // fixpointsList.classList.remove("d-none");
    // toggleIcon.classList.remove("fa-toggle-off");
    // toggleIcon.classList.add("fa-toggle-on");
    console.log("hey")
    map.classList.toggle("d-none");
    fixpointsList.classList.toggle("d-none");
    toggleIcon.classList.toggle("fa-toggle-off");
    toggleIcon.classList.toggle("fa-toggle-on");
  });
}
