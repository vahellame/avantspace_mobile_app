import 'package:avantspace_mobile_app/views/view_config.dart';
import 'package:avantspace_mobile_app/views/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class BadCharacteristicsScreen extends StatefulWidget {
  const BadCharacteristicsScreen({Key? key}) : super(key: key);

  @override
  State<BadCharacteristicsScreen> createState() => _BadCharacteristicsScreenState();
}

class _BadCharacteristicsScreenState extends State<BadCharacteristicsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: Container()),
            Image.asset(
              'assets/images/gear.png',
              width: 234,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Text(
                'Характеристики вашего устройства не соответствуют минимальным требованиям',
                style: ViewConfigTextStyles.headline6(ViewConfigColors.emphasisHigh),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 36, right: 36),
              child: Text(
                'Характеристики вашего устройства не соответствуют минимальным требованиям',
                style: ViewConfigTextStyles.body1(ViewConfigColors.emphasisMedium),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 36, right: 36),
              child: SizedBox(
                width: 112,
                child: PrimaryButton(
                  text: 'OK',
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/bad_place');
                  },
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
      backgroundColor: ViewConfigColors.bg,
    );
  }
}
