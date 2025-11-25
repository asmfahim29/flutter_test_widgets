// import 'package:get/get.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:get_storage/get_storage.dart';
//
// class LocationPermissionController extends GetxController {
//   final LocationService _locationService = LocationService();
//   final _storage = GetStorage();
//
//   // Observable states
//   final isLoading = false.obs;
//   final isPermissionGranted = false.obs;
//   final showPermissionUI = false.obs;
//
//   // Storage key
//   static const String _permissionGrantedKey = 'location_permission_granted';
//
//   @override
//   void onInit() {
//     super.onInit();
//     _checkInitialPermissionState();
//   }
//
//   // Check if permission was previously granted
//   Future<void> _checkInitialPermissionState() async {
//     // Check if permission was granted in a previous session
//     bool wasGranted = _storage.read(_permissionGrantedKey) ?? false;
//
//     if (wasGranted) {
//       // Double check the actual permission status
//       PermissionStatus status = await _locationService.getLocationPermissionStatus();
//
//       if (status.isGranted) {
//         isPermissionGranted.value = true;
//         showPermissionUI.value = false;
//         return;
//       } else {
//         // Permission was revoked, clear storage
//         _storage.remove(_permissionGrantedKey);
//       }
//     }
//
//     // Check current permission status
//     PermissionStatus status = await _locationService.getLocationPermissionStatus();
//
//     if (status.isGranted) {
//       isPermissionGranted.value = true;
//       showPermissionUI.value = false;
//       _storage.write(_permissionGrantedKey, true);
//     } else {
//       isPermissionGranted.value = false;
//       showPermissionUI.value = true;
//     }
//   }
//
//   // Request permission and fetch location
//   Future<void> requestLocationPermission() async {
//     if (isLoading.value) return; // Prevent multiple taps
//
//     isLoading.value = true;
//
//     try {
//       // Check if location service is enabled
//       bool isServiceEnabled = await _locationService.isLocationServiceEnabled();
//
//       if (!isServiceEnabled) {
//         Get.snackbar(
//           'Location Service Disabled',
//           'Please enable location services in your device settings',
//           snackPosition: SnackPosition.BOTTOM,
//           duration: Duration(seconds: 3),
//         );
//         isLoading.value = false;
//         return;
//       }
//
//       // Request permission
//       bool isGranted = await _locationService.checkPermission();
//
//       if (isGranted) {
//         // Get current location
//         Position? position = await _locationService.getCurrentLocation();
//
//         if (position != null) {
//           // Save permission state
//           _storage.write(_permissionGrantedKey, true);
//           isPermissionGranted.value = true;
//           showPermissionUI.value = false;
//
//           // Post to API
//           await _postLocationToAPI(position.latitude, position.longitude);
//
//           Get.snackbar(
//             'Success',
//             'Location permission granted',
//             snackPosition: SnackPosition.BOTTOM,
//             duration: Duration(seconds: 2),
//           );
//         } else {
//           Get.snackbar(
//             'Error',
//             'Unable to fetch location. Please try again.',
//             snackPosition: SnackPosition.BOTTOM,
//             duration: Duration(seconds: 2),
//           );
//         }
//       } else {
//         // Permission denied
//         PermissionStatus status = await _locationService.getLocationPermissionStatus();
//
//         if (status.isPermanentlyDenied) {
//           // Show dialog to open settings
//           _showSettingsDialog();
//         } else {
//           Get.snackbar(
//             'Permission Denied',
//             'Location permission is required to use this feature',
//             snackPosition: SnackPosition.BOTTOM,
//             duration: Duration(seconds: 3),
//           );
//         }
//       }
//     } catch (e) {
//       print('Error requesting permission: $e');
//       Get.snackbar(
//         'Error',
//         'Something went wrong. Please try again.',
//         snackPosition: SnackPosition.BOTTOM,
//         duration: Duration(seconds: 2),
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // Show dialog to open app settings
//   void _showSettingsDialog() {
//     Get.dialog(
//       AlertDialog(
//         title: Text('Permission Required'),
//         content: Text(
//           'Location permission is permanently denied. Please enable it from app settings to continue.',
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(),
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Get.back();
//               openAppSettings();
//             },
//             child: Text('Open Settings'),
//           ),
//         ],
//       ),
//       barrierDismissible: false,
//     );
//   }
//
//   // Post location to API
//   Future<void> _postLocationToAPI(double latitude, double longitude) async {
//     try {
//       // TODO: Replace with your actual API call
//       // Example:
//       // final response = await http.post(
//       //   Uri.parse('YOUR_API_ENDPOINT'),
//       //   body: {
//       //     'latitude': latitude.toString(),
//       //     'longitude': longitude.toString(),
//       //   },
//       // );
//
//       print('Posting location to API: Lat: $latitude, Lng: $longitude');
//
//       // Simulate API call
//       await Future.delayed(Duration(seconds: 1));
//
//     } catch (e) {
//       print('Error posting location to API: $e');
//       // Handle API error if needed
//     }
//   }
//
//   // Method to check permission when returning to home screen
//   Future<void> recheckPermission() async {
//     await _checkInitialPermissionState();
//   }
// }