import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(31.187084851056554, 29.928110526889437),
      zoom: 12,
    );
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (contrller) {
              googleMapController = contrller;
            },
            initialCameraPosition: initialCameraPosition,
            cameraTargetBounds: CameraTargetBounds(
              LatLngBounds(
                  southwest: const LatLng(31.08, 29.76),
                  northeast: const LatLng(31.30, 30.16)),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: ElevatedButton(
              onPressed: () {

                googleMapController.animateCamera(
                    CameraUpdate.newLatLng(const LatLng(31.18, 29.92)));
                // CameraPosition newLocation = const CameraPosition(
                //   target: LatLng(31.18, 29.92),
                //   zoom: 12,
                // );
                // googleMapController.animateCamera(
                //   CameraUpdate.newCameraPosition(newLocation),
                // );
              },
              child: const Text('Change location'),
            ),
          ),
        ],
      ),
    );
  }
}

// world view 0 -> 3
// country view 4 -> 6
// city view 10 -> 12
// street view 13 -> 17
// building view 18 -> 20