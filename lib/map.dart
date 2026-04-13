import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

import 'Ride/find_ride.dart';




class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _CurrentLocationMapState();
}

class _CurrentLocationMapState extends State<Map> {
  LatLng? _currentLatLng;
  LatLng? _selectedLatLng;
  final MapController _mapController = MapController();
  String? _error;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _error = 'Location services are disabled.';
      });
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        setState(() {
          _error = 'Location permission denied.';
        });
        return;
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final latLng = LatLng(position.latitude, position.longitude);

      setState(() {
        _currentLatLng = latLng;
        _selectedLatLng = latLng; // Use only one marker
        _error = null;
      });

      _mapController.move(latLng, 16.0);
    } catch (e) {
      setState(() {
        _error = 'Error getting location: $e';
      });
    }
  }

  void _onMapTapped(LatLng latLng) {
    setState(() {
      _selectedLatLng = latLng;
    });
  }

  void _onButtonPressed() {
    if (_selectedLatLng != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RideBookingScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a location on the map.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Select Location")),
        body: _currentLatLng == null
            ? _error != null
            ? Center(child: Text(_error!))
            : const Center(child: CircularProgressIndicator())
            : FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: _currentLatLng!,
            initialZoom: 16.0,
            onTap: (tapPosition, point) => _onMapTapped(point),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.yourapp',
            ),
            if (_selectedLatLng != null)
              MarkerLayer(
                markers: [
                  Marker(
                    point: _selectedLatLng!,
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: _onButtonPressed,
            child: const Icon(Icons.check, color: Colors.white),
            backgroundColor: Colors.blue,
            ),
        );
    }
}