import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('fixpoint_address');
  if (addressInput) {

    places({ appId: "plIOOOQLHYYT",
  apiKey: "71da46c6514a84da6503966a3e3825ec", container: addressInput });
  }
};

export { initAutocomplete };
