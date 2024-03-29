import 'package:avantspace_mobile_app/logic/camera.dart';
import 'package:avantspace_mobile_app/views/view_config.dart';
import 'package:avantspace_mobile_app/views/widgets/bottom_navigation_panel.dart';
import 'package:avantspace_mobile_app/views/widgets/custom_burger_button.dart';
import 'package:avantspace_mobile_app/views/widgets/custom_share_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageRecognizedScreen extends StatefulWidget {
  const MessageRecognizedScreen({Key? key}) : super(key: key);

  @override
  State<MessageRecognizedScreen> createState() => _MessageRecognizedScreenState();
}

class _MessageRecognizedScreenState extends State<MessageRecognizedScreen> {
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
            Container(
              color: const Color(0xffffffff),
              child: Row(
                children: [
                  Material(
                    color: const Color(0xffffffff),
                    child: InkWell(
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 24,
                          color: ViewConfigColors.emphasisHigh,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Сообщение распознано!',
                      style: ViewConfigTextStyles.headline6(ViewConfigColors.emphasisHigh),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Row(
                children: [
                  Text(
                    'Текст сообщения',
                    style: ViewConfigTextStyles.subtitle1(ViewConfigColors.emphasisHigh),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
              child: Container(
                decoration: BoxDecoration(color: const Color(0xffffffff), borderRadius: BorderRadius.circular(8)),
                height: 40,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Заходи: ',
                        style: ViewConfigTextStyles.body1(ViewConfigColors.emphasisHigh),
                      ),
                    ),
                    Material(
                      color: Colors.white,
                      child: InkWell(
                        child: Text(
                          'avantspace.com',
                          style: ViewConfigTextStyles.body1(ViewConfigColors.primary700).copyWith(decoration: TextDecoration.underline),
                        ),
                        onTap: () {
                          final Uri url = Uri.parse('https://avantspace.com');
                          launchUrl(url);
                        },
                      ),
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.content_copy,
                            color: ViewConfigColors.emphasisMedium,
                            size: 18,
                          ),
                        ),
                        onTap: () async {
                          await Clipboard.setData(const ClipboardData(text: 'Заходи: avantspace.com'));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 14, bottom: 14, left: 16, right: 12),
                        child: Text('Видео сохранено в галерею, вы можете поделится им прямо сейчас!'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CustomShareButton(
                        onTap: () {
                          Share.shareFiles(
                            [
                              context.read<CameraModel>().lastVideoFilePath,
                            ],
                            text: 'Заходи: avantspace.com',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: ViewConfigColors.bg,
    );
  }
}
