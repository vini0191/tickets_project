import "bootstrap";
import navbarScroll from "../components/navbar_scroll"
import flash from "../components/flash"
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initStarRating } from '../plugins/init_star_rating';
import { initInputMask } from '../components/init_input_mask';

navbarScroll();
initStarRating();
initMapbox();
initInputMask();
