import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomepageLogic extends ChangeNotifier {
  /// 🔹 Track chip states
  final Map<String, bool> selectedFilters = {
    "Age": false,
    "Height": false,
    "Habits": false,
  };

  bool get anyFilterSelected =>
      selectedFilters.values.any((isSelected) => isSelected);

  /// 🔹 Toggle filter selection
  void toggleFilter(String label) {
    if (selectedFilters.containsKey(label)) {
      selectedFilters[label] = !(selectedFilters[label] ?? false);
      notifyListeners();
    }
  }

  /// 🔹 Handle location permission + fetch location
  Future<void> handleAdjustLocation(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location service is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Location services are disabled."),
          action: SnackBarAction(
            label: "Enable",
            onPressed: () {
              Geolocator.openLocationSettings();
            },
          ),
        ),
      );
      return;
    }

    // Check permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location permission denied.")),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Location permissions are permanently denied."),
          action: SnackBarAction(
            label: "Settings",
            onPressed: () {
              Geolocator.openAppSettings();
            },
          ),
        ),
      );
      return;
    }

    // ✅ Get current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Location: ${position.latitude}, ${position.longitude}"),
      ),
    );
  }
}
