import 'package:flutter/material.dart';

class PermissionsHelper {
  Future<bool> isLocationPermissionEnabled() async {
    if (await Permission.locationAlways.serviceStatus.isEnabled) {
      return true;
    }
    return false;
  }

  Future<void> requestLocationPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
    ].request();
    debugPrint(
        '-------- Location Permission ------------ \n ${statuses[Permission.location]}');
    // await Permission.locationAlways.request();
  }

  Future<bool> requestCameraPermission() async {
    if (await Permission.camera.request().isGranted) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> requestStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      return true;
    } else {
      return false;
    }
  }
}
