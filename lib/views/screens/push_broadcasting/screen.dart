
import 'package:avantspace_mobile_app/views/view_config.dart';
import 'package:avantspace_mobile_app/views/widgets/custom_close_button.dart';
import 'package:avantspace_mobile_app/views/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PushBroadcastingScreen extends StatefulWidget {
  const PushBroadcastingScreen({Key? key}) : super(key: key);

  @override
  State<PushBroadcastingScreen> createState() => _PushBroadcastingScreenState();
}

class _PushBroadcastingScreenState extends State<PushBroadcastingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16, top: 16),
                        child: CustomCloseButton(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/bad_characteristics');
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
                  Image.asset(
                    'assets/images/map.png',
                    width: 234,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                    child: Text(
                      'В вашем регионе запланирован сеанс вещания из космоса!',
                      style: ViewConfigTextStyles.headline6(ViewConfigColors.emphasisHigh),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 36, right: 36),
                    child: Text(
                      'Сеанс пройдет 23 января с 17:00 до 17:30 по местному времени',
                      style: ViewConfigTextStyles.body1(ViewConfigColors.emphasisHigh),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 36, right: 36),
                    child: SizedBox(
                      child: PrimaryButton(
                        text: 'подробнее'.toUpperCase(),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/bad_characteristics');
                        },
                      ),
                      width: 177,
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: ViewConfigColors.bg,
      ),
    );
  }
}
