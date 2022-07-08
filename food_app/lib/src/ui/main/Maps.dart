import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/src/ui/widget/maps/AppBarMaps.dart';
import 'package:food_app/src/utility/FadeAnimation.dart';
import 'package:food_app/src/utility/SessionManager.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class Maps extends StatefulWidget {
  VoidCallback? getAddress;
  Maps({required this.getAddress});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Completer<GoogleMapController> _completer = Completer();
  static LatLng? latLng;

  final Set<Marker> _markes = {};
  late List<Placemark> placemark;
  Position? _position;

  late double lat, lng;
  late String _alamat;
  late bool isSave, isSet;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSave = false;
    isSet = false;

    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMaps(context: context),
      body: latLng == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: latLng!,
                      zoom: 15.0,
                    ),
                    markers: _markes,
                    onMapCreated: _onMapCreated,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    mapType: MapType.normal,
                    zoomControlsEnabled: true,
                    onTap: (position) {
                      setState(() {
                        isSet = true;

                        _markes.clear();

                        lat = position.latitude;
                        lng = position.longitude;

                        _markes.add(Marker(
                            markerId: MarkerId(
                                "${position.latitude}, ${position.longitude}"),
                            icon: BitmapDescriptor.defaultMarker,
                            position: position,
                            onTap: () {
                              setState(() {
                                isSet = true;
                              });
                            }));
                      });
                    },
                  ),
                ),
                if (isSave)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                if (isSet)
                  Positioned(
                      bottom: 10.0,
                      left: 0.1,
                      right: 0.1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Material(
                                elevation: 1.0,
                                color: Colors.blue[800],
                                borderRadius: BorderRadius.circular(5.0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(5.0),
                                  onTap: () {
                                    _setAlamat();
                                  },
                                  child: Container(
                                    width: 100.0,
                                    padding: EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text(
                                        'PILIH LOKASI INI',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Material(
                              elevation: 1.0,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5.0),
                                onTap: () {
                                  setState(() {
                                    isSet = false;
                                  });
                                },
                                child: Container(
                                  width: 40.0,
                                  padding: EdgeInsets.all(6.0),
                                  child: Center(
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
              ],
            ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _completer = controller;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _completer.complete(controller);
  }

  _getLocation() async {
    PermissionStatus ps = await Permission.location.status;

    if (ps == PermissionStatus.denied) {
      await Permission.locationAlways.request();
    }

    Position position = await _determinePosition();
    _position = position;
    if (_position != null) {
      if (mounted) {
        setState(() {
          latLng = LatLng(_position!.latitude, _position!.longitude);
        });
      }
    }
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  _setAlamat() async {
    setState(() {
      isSave = true;
    });

    try {
      placemark =
          await GeocodingPlatform.instance.placemarkFromCoordinates(lat, lng);

      if (mounted) {
        setState(() {
          _alamat = placemark[0].name.toString() +
              ", " +
              placemark[0].subLocality.toString() +
              ", " +
              placemark[0].locality.toString() +
              ", " +
              placemark[0].administrativeArea.toString() +
              ", " +
              placemark[0].country.toString();
        });
      }
    } catch (e) {
      print(e.toString());
    }

    print(_alamat);

    SessionManager().setSessionAddress(lat, lng, _alamat);

    setState(() {
      isSave = false;
    });

    Navigator.pop(context);
    widget.getAddress!();
  }
}
