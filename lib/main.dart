import 'dart:io';

import 'package:avantspace_mobile_app/logic/bottom_navigation_panel.dart';
import 'package:avantspace_mobile_app/logic/camera.dart';
import 'package:avantspace_mobile_app/views/screens/bad_characteristics/screen.dart';
import 'package:avantspace_mobile_app/views/screens/bad_place/screen.dart';
import 'package:avantspace_mobile_app/views/screens/faq/screen.dart';
import 'package:avantspace_mobile_app/views/screens/home/screen.dart';
import 'package:avantspace_mobile_app/views/screens/map/screen.dart';
import 'package:avantspace_mobile_app/views/screens/message_recognized/screen.dart';
import 'package:avantspace_mobile_app/views/screens/push_broadcasting/screen.dart';
import 'package:avantspace_mobile_app/views/screens/splash/screen.dart';
import 'package:avantspace_mobile_app/views/screens/test/screen.dart';
import 'package:avantspace_mobile_app/views/screens/upcoming_sessions/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

Future<void> init(BuildContext context) async {
  await Future.delayed(const Duration(milliseconds: 1)); // Without this total fuck

  Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
    Permission.storage,
    Permission.camera,
    Permission.microphone,
  ].request();

  for (Permission permission in statuses.keys.toList()) {
    if (statuses[permission] != PermissionStatus.granted) {
      exit(0);
    }
  }

  // FUCK
  // HERE WE GO
  await Future.delayed(const Duration(seconds: 1));
  await context.read<CameraModel>().init();
  await context.read<BottomNavigationPanelModel>().init();
  await  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

  print('init is done');
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      child: const AvantspaceApp(),
      providers: [
        ChangeNotifierProvider(create: (_) => CameraModel()),
        ChangeNotifierProvider(create: (_) => BottomNavigationPanelModel()),
      ],
    ),
  );
}

class AvantspaceApp extends StatefulWidget {
  const AvantspaceApp({Key? key}) : super(key: key);

  @override
  State<AvantspaceApp> createState() => _AvantspaceAppState();
}

class _AvantspaceAppState extends State<AvantspaceApp> {
  late Future<void> _initFuture;
  @override
  void initState() {
    _initFuture = init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget? child) {
        return FutureBuilder(
          future: _initFuture,
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return child!;
            } else {
              return const SplashScreen();
            }
          },
        );
      },
      initialRoute: '/home',
      routes: {
        '/push_broadcasting': (context) => const PushBroadcastingScreen(),
        '/bad_characteristics': (context) => const BadCharacteristicsScreen(),
        '/bad_place': (context) => const BadPlaceScreen(),
        '/home': (context) => const HomeScreen(),
        '/message_recognized': (context) => const MessageRecognizedScreen(),
        '/upcoming_sessions': (context) => const UpcomingSessionsScreen(),
        '/map': (context) => const MapScreen(),
        '/faq': (context) => const FAQScreen(),
        '/test': (context) => const TestScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
