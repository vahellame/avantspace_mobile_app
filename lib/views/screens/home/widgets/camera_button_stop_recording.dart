import 'package:flutter/material.dart';

class CameraButtonStopRecording extends StatelessWidget {
  const CameraButtonStopRecording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffE3000F),
        shape: BoxShape.circle,
      ),
      height: 64,
      width: 64,
      child: const Center(
        child: Icon(
          Icons.stop_rounded,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
