import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import places from 'places.js';


const initAutocomplete = () => {
  const addressInput = document.getElementById('event_location');
  if (addressInput) {
    places({
      appId: 'plKIR3DFYF5Z',
      apiKey: '26497318b39e17711eebb48f5521e093',
      container: addressInput
    });
  }

};

// const webAPI = (place,map) => {
//   fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${place}.json?proximity=-74.70850,40.78375&access_token=pk.eyJ1IjoidG1weWVhaCIsImEiOiJjazJnZzlqOGMwdXFqM2luMGIyM21qd2RlIn0._-4Vwt5wYoIYbuv9BrfTNQ`)
//     .then(response => response.json())
//     .then((data) => {
//       // debugger;
//       const coordinates = data.features[0].center;
//       const marker = { lat: coordinates[1], lng: coordinates[0] }
//       fitMapToMarkers2(marker,map);
//     });
// }


const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};
// const fitMapToMarkers2 = (marker,map) => {
//   //const mapElement = document.getElementById('map')
//   const bounds = new mapboxgl.LngLatBounds();
//   bounds.extend([marker.lng, marker.lat]);
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
// };

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      // style: 'mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb'
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    if (markers != null) {
      markers.forEach((marker) => {
        // const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
        // Create a HTML element for your custom marker
        const element = document.createElement('div');
        element.className = 'marker';

        element.style.width = '25px';
        element.style.height = '25px';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        // Pass the element as an argument to the new marker
        new mapboxgl.Marker(element)
          .setLngLat([marker.lng, marker.lat])
          // .setPopup(popup)
          .addTo(map);
      });
      fitMapToMarkers(map, markers);
    }
  //   const location = document.getElementById('event_location');
  //   location.addEventListener('blur', event => {
  //     const place = event.target.value;
  //     webAPI(place,map)

  // });

    map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    }));

  }
};

export { initMapbox, initAutocomplete };