import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class CameraModel with ChangeNotifier {
  CameraModel();

  late List<CameraDescription> _cameras;
  late String _lastVideoFilePath;

  List<CameraDescription> get cameras => _cameras;
  String get lastVideoFilePath => _lastVideoFilePath;

  Future<void> init() async {
    _cameras = await availableCameras();
    _lastVideoFilePath = '';
  }

  void setLastVideoFilePath(String value) {
    _lastVideoFilePath = value;
    notifyListeners();
  }
}
