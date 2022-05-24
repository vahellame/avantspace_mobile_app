import 'package:flutter/material.dart';

class CameraButtonRecordVideo extends StatelessWidget {
  const CameraButtonRecordVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffE3000F),
            shape: BoxShape.circle,
          ),
          height: 16,
          width: 16,
        ),
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      height: 64,
      width: 64,
    );
  }
}
