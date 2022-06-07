import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(bottom: 64),
                child: SvgPicture.asset('assets/images/logo.svg'),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash_bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
