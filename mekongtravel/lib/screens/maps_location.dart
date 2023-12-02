import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MapsScreen());
}

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  GoogleMapController? mapController;
  LocationPermission? permission;
  bool isPermissionGranted = false;
  Position? position;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  void checkPermission() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission != LocationPermission.deniedForever) {
      setState(() {
        isPermissionGranted = true;
      });
      getPosition();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF263238),
        title: Row(
          children: [
            Text('Bản đồ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),)
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {},
            ),
          ),
        ],
      ),
    );
  }

  void getPosition() async {
    position = await Geolocator.getCurrentPosition();

    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position!.latitude, position!.longitude),
          zoom: 16,
        ),
      ),
    );

    markers = {};

    markers.add(
      Marker(
        markerId: MarkerId('current_location'),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(position!.latitude, position!.longitude),
      ),
    );

    for (var item in _listPlaces) {
      markers.add(
        Marker(
          markerId: MarkerId(item.name),
          position: LatLng(item.latitude, item.longitude),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: item.name,
            snippet: item.address,
          ),
        ),
      );
    }

    setState(() {});
  }

  final List<Place> _listPlaces = [
    Place(
      name: "Đại học Cần Thơ",
      address: "Đường 3/2, Phường Xuân Khánh, Quận Ninh Kiều, Thành phố Cần Thơ",
      latitude: 10.025584,
      longitude: 105.755669,
    ),
    Place(
      name: "Công viên Tuổi Trẻ",
      address: "Công viên Tuổi Trẻ, Phường Xuân Khánh, Quận Ninh Kiều, Thành phố Cần Thơ",
      latitude: 10.025898,
      longitude: 105.756316,
    ),
    Place(
      name: "Bảo tàng Cần Thơ",
      address: "Phường Xuân Khánh, Quận Ninh Kiều, Thành phố Cần Thơ",
      latitude: 10.025584,
      longitude: 105.755669,
    ),
  ];
}

class Place {
  String name;
  String address;
  double latitude;
  double longitude;

  Place({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}
