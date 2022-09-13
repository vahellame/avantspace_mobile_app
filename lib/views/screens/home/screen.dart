import 'package:avantspace_mobile_app/logic/camera.dart';
import 'package:avantspace_mobile_app/views/screens/home/widgets/camera_button_record_video.dart';
import 'package:avantspace_mobile_app/views/screens/home/widgets/camera_button_stop_recording.dart';
import 'package:avantspace_mobile_app/views/view_config.dart';
import 'package:avantspace_mobile_app/views/widgets/bottom_navigation_panel.dart';
import 'package:avantspace_mobile_app/views/widgets/custom_burger_button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:provider/provider.dart';

enum CameraButtonState { recordVideo, stopRecording, takePhoto }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final GlobalKey _globalKey = GlobalKey();
  late  CameraController? _controller;
  late Future<void> _initializeControllerFuture;
  late CameraButtonState _cameraButtonState;

  @override
  void initState() {
    super.initState();
    _ambiguate(WidgetsBinding.instance)?.addObserver(this);

    _controller = CameraController(
      context.read<CameraModel>().cameras[0],
      ResolutionPreset.max,
      enableAudio: true,
    );
    _controller!.addListener(controllerListener);
    _initializeControllerFuture = _controller!.initialize();
    _cameraButtonState = CameraButtonState.recordVideo;

    // Future.delayed(const Duration(milliseconds: 3)).then(
    //   (_) async {
    //     if (MediaQuery.of(context).size.height / MediaQuery.of(context).size.width <= 1920 / 1080) {
    //         (_) {
    //           setState(() {});
    //         },
    //       );
    //     } else {
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    key: _globalKey,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && _controller!.value.isInitialized && _controller != null) {
                final RenderBox box = _globalKey.currentContext!.findRenderObject() as RenderBox;
                final double screenWidth = box.size.width;
                final double screenHeight = box.size.height;
                const double fullHdK = 1920 / 1080;
                final double scale;
                if (screenHeight / screenWidth > fullHdK) {
                  scale = screenHeight / screenWidth / fullHdK;
                } else {
                  scale = 1;
                }
                return Column(
                  children: [
                    Container(
                      color: Colors.black,
                      height: (screenHeight - screenHeight / scale) / 2,
                    ),
                    Transform.scale(
                      filterQuality: FilterQuality.high,
                      scale: scale,
                      child: CameraPreview(
                        _controller!,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white, width: 3)),
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Center(
            child: Column(
              children: [
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
                        height: 56,
                        width: 56,
                        child: const Center(
                          child: Icon(
                            Icons.center_focus_strong_rounded,
                            size: 32,
                            color: ViewConfigColors.primary700,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          try {
                            switch (_cameraButtonState) {
                              case CameraButtonState.recordVideo:
                                await _controller!.startVideoRecording();
                                Future.delayed(const Duration(seconds: 5)).then(
                                  (_) async {
                                    final XFile xfile = await _controller!.stopVideoRecording();
                                    await GallerySaver.saveVideo(xfile.path);
                                    if (!mounted) return;
                                    context.read<CameraModel>().setLastVideoFilePath(xfile.path);
                                    Navigator.pushReplacementNamed(context, '/message_recognized');
                                    setState(
                                          () {
                                        _cameraButtonState = CameraButtonState.recordVideo;
                                      },
                                    );
                                  },
                                );
                                setState(
                                  () {
                                    _cameraButtonState = CameraButtonState.stopRecording;
                                  },
                                );
                                break;
                              case CameraButtonState.stopRecording:
                                final XFile xfile = await _controller!.stopVideoRecording();
                                await GallerySaver.saveVideo(xfile.path);
                                if (!mounted) return;
                                context.read<CameraModel>().setLastVideoFilePath(xfile.path);
                                Navigator.pushReplacementNamed(context, '/message_recognized');
                                setState(
                                  () {
                                    _cameraButtonState = CameraButtonState.recordVideo;
                                  },
                                );
                                break;
                              case CameraButtonState.takePhoto:
                                // TODO: Handle this case.
                                break;
                            }
                          } catch (e) {
                            try {
                              await _controller!.dispose();
                              setState(
                                () {
                                  _controller = null;
                                },
                              );
                              if (!mounted) return;
                              _controller = CameraController(
                                context.read<CameraModel>().cameras[0],
                                ResolutionPreset.max,
                                enableAudio: true,
                              );
                              await _controller!.initialize();
                              _controller!.addListener(controllerListener);
                              setState(
                                () {
                                  // _initializeControllerFuture = _controller!.initialize();
                                  _cameraButtonState = CameraButtonState.recordVideo;
                                },
                              );
                            } catch (e) {
                              print('FUCK 2 $e');
                            }
                          }
                        },
                        borderRadius: BorderRadius.circular(56),
                        child: Builder(
                          builder: (BuildContext context) {
                            switch (_cameraButtonState) {
                              case CameraButtonState.recordVideo:
                                return const CameraButtonRecordVideo();
                              case CameraButtonState.stopRecording:
                                return const CameraButtonStopRecording();
                              case CameraButtonState.takePhoto:
                                return const CameraButtonRecordVideo();
                            }
                          },
                        ),
                      ),
                      CustomBurgerButton(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }

  void controllerListener() {
    if (mounted) {
      setState(() {});
    }
    if (_controller!.value.hasError) {
      print('FUCKING ERROR ${_controller!.value.errorDescription}');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _controller = CameraController(
        context.read<CameraModel>().cameras[0],
        ResolutionPreset.max,
        enableAudio: true,
      );
      _controller!.addListener(controllerListener);
      setState(
        () {
          _initializeControllerFuture = _controller!.initialize();
        },
      );
    }
  }

  @override
  void dispose() {
    _ambiguate(WidgetsBinding.instance)?.removeObserver(this);
    super.dispose();
  }
}

T? _ambiguate<T>(T? value) => value;
