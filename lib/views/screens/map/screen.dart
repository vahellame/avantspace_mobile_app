import 'dart:async';
import 'dart:typed_data';

import 'package:avantspace_mobile_app/views/view_config.dart';
import 'package:avantspace_mobile_app/views/widgets/bottom_navigation_panel.dart';
import 'package:avantspace_mobile_app/views/widgets/custom_burger_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LatLng _latLngTarget = const LatLng(55.69176097861798, 37.34776545560878);
  final GlobalKey _globalKeyMe = GlobalKey();
  final GlobalKey _globalKeyTarget = GlobalKey();
  late LatLng? _latLngMe;
  late Set<Circle> _circles;
  late LocationData _locationData;
  late Uint8List? _iconMeBytes;
  late Uint8List? _iconTargetBytes;
  late final GoogleMapController _googleMapController;

  @override
  void initState() {
    print('map init state');
    _iconMeBytes = null;
    _iconTargetBytes = null;
    _latLngMe = const LatLng(55.693497039524914, 37.36316177560043);

    _circles = <Circle>{};
    _circles.add(
      Circle(
        circleId: const CircleId('42'),
        center: _latLngTarget,
        radius: 10000,
        fillColor: ViewConfigColors.primary700.withOpacity(0.08),
        strokeWidth: 2,
        strokeColor: ViewConfigColors.primary700.withOpacity(0.38),
      ),
    );

    Location location = Location();
    location.serviceEnabled().then(
      (_serviceEnabled) async {
        if (!_serviceEnabled) {
          _serviceEnabled = await location.requestService();
        }
        PermissionStatus _permissionGranted = await location.hasPermission();
        if (_permissionGranted == PermissionStatus.denied) {
          _permissionGranted = await location.requestPermission();
        }
        location.getLocation().then(
          (LocationData value) async {
            await Future.delayed(const Duration(milliseconds: 3));
            _locationData = value;
            if (mounted && value.latitude != null && value.longitude != null) {
              setState(
                () {
                  _latLngMe = LatLng(_locationData.latitude!, _locationData.longitude!);
                },
              );
            }
          },
        );
        location.onLocationChanged.listen(
          (LocationData value) async {
            await Future.delayed(const Duration(milliseconds: 3));
            _locationData = value;
            if (mounted && value.latitude != null && value.longitude != null) {
              setState(
                () {
                  _latLngMe = LatLng(_locationData.latitude!, _locationData.longitude!);
                },
              );
            }
          },
        );
      },
    );
    Future.delayed(Duration(milliseconds: 100)).then(
      (_) {
        _createIconMeBytes();
        _createIconTargetBytes();
        },
    );
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        _createIconMeBytes();
        _createIconTargetBytes();
      },
    );
    _prepareIcons().then(
      (_) {
        setState(
          () {},
        );
      },
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    print('init state');
    super.initState();
  }

  Widget _iconMe() {
    return RepaintBoundary(
      key: _globalKeyMe,
      child: StreamBuilder<CompassEvent>(
        stream: FlutterCompass.events,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final double? direction = snapshot.data!.heading;
            return Transform.rotate(
              angle: (direction! * (math.pi / 180) * -1),
              child: Container(
                child: const Icon(
                  Icons.navigation_rounded,
                  size: 24,
                  color: Colors.white,
                ),
                decoration: const BoxDecoration(
                  color: ViewConfigColors.primary700,
                  shape: BoxShape.circle,
                ),
                height: 32,
                width: 32,
              ),
            );
          }
          return Container(
            child: const Icon(
              Icons.navigation_rounded,
              size: 24,
              color: Colors.white,
            ),
            decoration: const BoxDecoration(
              color: ViewConfigColors.primary700,
              shape: BoxShape.circle,
            ),
            height: 32,
            width: 32,
          );
        },
      ),
    );
  }

  Widget _iconTarget() {
    return RepaintBoundary(
      key: _globalKeyTarget,
      child: const Icon(
        Icons.place_rounded,
        size: 40,
        color: ViewConfigColors.primary700,
      ),
    );
  }

  Future<void> _createIconMeBytes() async {
    try {
      RenderRepaintBoundary? boundary = _globalKeyMe.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 2.5);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      setState(
        () {
          _iconMeBytes = byteData!.buffer.asUint8List();
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> _createIconTargetBytes() async {
    try {
      RenderRepaintBoundary? boundary = _globalKeyTarget.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 2.5);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      setState(
        () {
          _iconTargetBytes = byteData!.buffer.asUint8List();
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> _prepareIcons() async {
    await _createIconTargetBytes();
    await _createIconMeBytes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _iconTarget(),
            _iconMe(),
            _iconTargetBytes != null && _iconMeBytes != null
                ? GoogleMap(
                    onMapCreated: (GoogleMapController value) {
                      _googleMapController = value;
                    },
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: _latLngTarget,
                      zoom: 13.0,
                    ),
                    markers: _markers(),
                    circles: _circles,
                  )
                : Container(
                    color: Colors.white,
                  ),
            Center(
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16, bottom: 16),
                        child: Material(
                          child: InkWell(
                            child: Container(
                              child: const Center(
                                child: Icon(
                                  Icons.near_me_rounded,
                                  color: ViewConfigColors.emphasisHigh,
                                  size: 32,
                                ),
                              ),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                              ),
                              height: 56,
                              width: 56,
                            ),
                            onTap: () {
                              _googleMapController.moveCamera(CameraUpdate.newLatLng(_latLngMe!));
                            },
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          color: Colors.white,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16, right: 16),
                        child: CustomBurgerButton(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return const BottomNavigationPanel();
                              },
                              backgroundColor: Colors.transparent,
                            );
                          },
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16, bottom: 16),
                        child: Material(
                          child: InkWell(
                            child: Container(
                              child: const Center(
                                child: Icon(
                                  Icons.add_rounded,
                                  color: ViewConfigColors.emphasisHigh,
                                  size: 32,
                                ),
                              ),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                              ),
                              height: 56,
                              width: 56,
                            ),
                            onTap: () {
                              _googleMapController.moveCamera(CameraUpdate.zoomIn());
                            },
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          color: Colors.white,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16, bottom: 16),
                        child: Material(
                          child: InkWell(
                            child: Container(
                              child: const Center(
                                child: Icon(
                                  Icons.remove_rounded,
                                  color: ViewConfigColors.emphasisHigh,
                                  size: 32,
                                ),
                              ),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                              ),
                              height: 56,
                              width: 56,
                            ),
                            onTap: () {
                              _googleMapController.moveCamera(CameraUpdate.zoomOut());
                            },
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          color: Colors.white,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  size: 18,
                                  color: ViewConfigColors.primary700,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0, right: 8),
                                child: Text(
                                  '24.02.2022; 14:00',
                                  style: ViewConfigTextStyles.body1(ViewConfigColors.emphasisHigh),
                                ),
                              ),
                            ],
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                          ),
                          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(32)), color: Colors.white),
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 12),
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/icon_time_primary700.svg',
                                    height: 18,
                                    color: ViewConfigColors.primary700,
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0, right: 8),
                                child: Text(
                                  '14:05:22',
                                  style: ViewConfigTextStyles.body1(ViewConfigColors.emphasisHigh),
                                ),
                              ),
                            ],
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                          ),
                          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(32)), color: Colors.white),
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Set<Marker> _markers() {
    final Set<Marker> markers = <Marker>{};
    markers.add(
      Marker(
        markerId: const MarkerId('me'),
        position: _latLngMe!,
        icon: BitmapDescriptor.fromBytes(_iconMeBytes!),
      ),
    );
    markers.add(
      Marker(
        markerId: const MarkerId('target'),
        position: _latLngTarget,
        icon: BitmapDescriptor.fromBytes(_iconTargetBytes!),
      ),
    );
    return markers;
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }
}
