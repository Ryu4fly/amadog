import mapboxgl from "mapbox-gl";

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: "map",
    style: "mapbox://styles/mapbox/streets-v10",
    // style:
    //   "mapbox://styles/v1/nikoandpiko/cknkb67yb0gxl17pna2xj3yjw.html?fresh=true&title=view&access_token=pk.eyJ1Ijoibmlrb2FuZHBpa28iLCJhIjoiY2tpNXltMWZxMDZ2NjJzcnpsbDMwbHczZCJ9.6ASzMSjzenK0QMiwM__qjg",
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    new mapboxgl.Marker()
    .setLngLat([marker.lng, marker.lat])
    .setPopup(new mapboxgl.Popup({ offset: 25 })
    .setHTML(marker.infoWindow.content))
    .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById("map");
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };

//  ********************************** Previous Code

// import "mapbox-gl/dist/mapbox-gl.css";
// import "@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css";
// import mapboxgl from "mapbox-gl";
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";
// import { map } from "jquery";

// const mapElement = document.getElementById("map");

// if (mapElement) {
//   mapboxgl.accessToken = process.env.MAPBOX_API_KEY;
//   const map = new mapboxgl.Map({
//     container: "map",
//     style:
//       "mapbox://styles/v1/nikoandpiko/cknkb67yb0gxl17pna2xj3yjw.html?fresh=true&title=view&access_token=pk.eyJ1Ijoibmlrb2FuZHBpa28iLCJhIjoiY2tpNXltMWZxMDZ2NjJzcnpsbDMwbHczZCJ9.6ASzMSjzenK0QMiwM__qjg",
//   });
// }

// https: const buildMap = (mapElement) => {
//   mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//   return new mapboxgl.Map({
//     container: "map",
//     style: "mapbox://styles/mapbox/streets-v10",
//   });
// };

// const addMarkersToMap = (map, markers) => {
//   markers.forEach((marker) => {
//     const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

//     const element = document.createElement("div");
//     element.className = "marker";
//     element.style.backgroundImage = `url('${marker.image_url}')`;
//     element.style.backgroundSize = "contain";
//     element.style.width = "25px";
//     element.style.height = "25px";

//     new mapboxgl.Marker(element)
//       .setLngLat([marker.lng, marker.lat])
//       .setPopup(popup)
//       .addTo(map);
//   });
// };

// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
// };

// const initMapbox = () => {
//   const mapElement = document.getElementById("map");
//   if (mapElement) {
//     const map = buildMap(mapElement);
//     const markers = JSON.parse(mapElement.dataset.markers);
//     addMarkersToMap(map, markers);
//     fitMapToMarkers(map, markers);

//     map.addControl(
//       new MapboxGeocoder({
//         accessToken: mapboxgl.accessToken,
//         mapboxgl: mapboxgl,
//       })
//     );
//   }
// };

// const addressInput = document.getElementById("user_address");

// if (addressInput) {
//   const places = require("places.js");
//   const placesAutoComplete = places({
//     container: addressInput,
//   });
// }

// export { initMapbox };
