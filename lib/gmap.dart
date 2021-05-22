import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatefulWidget {
  GMap({Key key}) : super(key: key);
  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Polyline> _polylines = HashSet<Polyline>();
  Set<Circle> _circles = HashSet<Circle>();

  GoogleMapController mapController;
  final LatLng _center = const LatLng(3.157764, 101.711861);

  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    // TODO: implement initState
    _setMarkerIcon();
    _setPolygons();
    _setPolylines();
    _setCircle();
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/twintowers.png');
  }

  void _setMapStyle() async {
    String style =
        await DefaultAssetBundle.of(context).loadString('assets/style.json');
    mapController.setMapStyle(style);
  }

  void _setPolygons() {
    List<LatLng> polygonLatLongs = [];

    polygonLatLongs.add(LatLng(3.1468, 101.7120));
    polygonLatLongs.add(LatLng(3.1488, 101.7150));
    polygonLatLongs.add(LatLng(3.1498, 101.7160));
    polygonLatLongs.add(LatLng(3.1468, 101.7180));

    _polygons.add(
      Polygon(
        polygonId: PolygonId("0"),
        points: polygonLatLongs,
        fillColor: Colors.white,
        strokeWidth: 1,
      ),
    );
  }

  void _setPolylines() {
    List<LatLng> polylineLatLongs = [];

    polylineLatLongs.add(LatLng(3.1483, 101.72922));
    polylineLatLongs.add(LatLng(3.1493, 101.71932));
    polylineLatLongs.add(LatLng(3.1473, 101.71942));
    polylineLatLongs.add(LatLng(3.1483, 101.72922));

    _polylines.add(
      Polyline(
        polylineId: PolylineId("0"),
        points: polylineLatLongs,
        color: Colors.purple,
        width: 1,
      ),
    );
  }

  void _setCircle() {
    _circles.add(Circle(
      circleId: CircleId("0"),
      center: LatLng(3.1650, 101.7157),
      radius: 100,
      strokeWidth: 2,
      fillColor: Color.fromRGBO(102, 51, 153, .5),
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: LatLng(3.157764, 101.711861),
          infoWindow: InfoWindow(
            title: "KLCC Twin Towers",
            snippet: "The Petronas Twin Towers",
          ),
          icon: _markerIcon,
        ),
      );
    });
    _setMapStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
        ),
        body: Stack(children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0,
            ),
            markers: _markers,
            polygons: _polygons,
            polylines: _polylines,
            circles: _circles,
            // myLocationEnabled: true,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
            child: Text("KUALA LUMPUR"),
          )
        ]));
  }
}
