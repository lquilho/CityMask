import mapboxgl from 'mapbox-gl';
// import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/light-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';

    // Pass the element as an argument to the new marker
    new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);

    // The marker was just created
    if (marker.newly_created) {
      popup.addTo(map);
    }
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 75, linear: true });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);

    if (markers.length > 0) {
      addMarkersToMap(map, markers);
    }

    // Fit the map to the added markers
    fitMapToMarkers(map, markers);

    // Center the map to the defined center lat and lon if those are defined in the map element
    const centerLat = parseFloat(mapElement.dataset.centerLat);

    if (centerLat) {
      const centerLon = parseFloat(mapElement.dataset.centerLon);
      map.flyTo({ center: [centerLon, centerLat], zoom: 18 });
    }

    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
    map.addControl(new mapboxgl.NavigationControl());
    // const last_element = markers[markers.length - 1];
    // map.flyTo({
    // center: [
    // last_element.lng,
    // last_element.lat ]
    // });
  }
};

export { initMapbox };
