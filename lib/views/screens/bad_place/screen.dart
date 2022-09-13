import 'package:avantspace_mobile_app/views/view_config.dart';
import 'package:avantspace_mobile_app/views/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class BadPlaceScreen extends StatefulWidget {
  const BadPlaceScreen({Key? key}) : super(key: key);

  @override
  State<BadPlaceScreen> createState() => _BadPlaceScreenState();
}

class _BadPlaceScreenState extends State<BadPlaceScreen> {
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
              'assets/images/camera.png',
              width: 234,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Text(
                'Вы выбрали неудачное место для съемки',
                style: ViewConfigTextStyles.headline6(ViewConfigColors.emphasisHigh),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 36, right: 36),
              child: Text(
                'Надо бы объяснить почему оно неудачное',
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
                    Navigator.pushReplacementNamed(context, '/home');
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
