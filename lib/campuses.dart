import 'package:google_maps_flutter/google_maps_flutter.dart';

class Campus{
  String campusName;
  String address;
  String description;
  LatLng locationCords;

  Campus ({
    this.campusName,this.address,this.description,this.locationCords,
  });
}

final List<Campus> campus = [

  Campus(
    campusName: 'Mbarara Campus',
    address: '18 W 28th st',
    description: 'Virue et Sapienta Duc Mundum',
    locationCords: LatLng(40.74883, -73.988213),
  ),
   Campus(
    campusName: 'Kampala Campus',
    address: '29 W 128th st',
    description: 'Virue et Sapienta Duc Mundum',
    //locationCords: LatLng(40.751908, -73.988213),
    locationCords: LatLng(41.721622, -72.934308),
  ),
   Campus(
    campusName: 'Rubaga Campus',
    address: '58 W  Leo st ',
    description: 'Virue et Sapienta Duc Mundum',
    //locationCords: LatLng(40.730148, -73.999639),
    locationCords: LatLng(42.721722, -73.934308),
  ),
   Campus(
    campusName: 'FortPortal Campus',
    address: '48 W Johns st',
    description: 'Virue et Sapienta Duc Mundum',
   // locationCords: LatLng(40.729515, -73.985927),
    locationCords: LatLng(46.721822, -79.935308),
  ),
   Campus(
    campusName: 'Masaka Campus',
    address: '78 W Wade st',
    description: 'Virue et Sapienta Duc Mundum',
   // locationCords: LatLng(40.721622, -73.904308),
    locationCords: LatLng(40.72122, -83.934308),
  ),
   Campus(
    campusName: 'Nsambya Campus',
    address: '23 W Lebron st',
    description: 'Virue et Sapienta Duc Mundum',
    locationCords: LatLng(49.721622, -73.924308),
    //locationCords: LatLng(0.301667, -32.585289),
  ),
   Campus(
    campusName: 'Kabale Campus',
    address: '34 E Giannis st',
    description: 'Virue et Sapienta Duc Mundum',
    //locationCords: LatLng(40.721622, -73.934308),
    locationCords: LatLng(56.725622, -72.934308),
  ),
   Campus(
    campusName: 'Mbale Campus',
    address: '18 N Kawhi st',
    description: 'Virue et Sapienta Duc Mundum',
    //locationCords: LatLng(40.721622, -73.954308),
    locationCords: LatLng(34.721622, -71.934308),
  ),

  

];