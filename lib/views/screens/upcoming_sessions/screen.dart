import 'package:avantspace_mobile_app/views/view_config.dart';
import 'package:avantspace_mobile_app/views/widgets/bottom_navigation_panel.dart';
import 'package:avantspace_mobile_app/views/widgets/custom_burger_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpcomingSessionsScreen extends StatefulWidget {
  const UpcomingSessionsScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingSessionsScreen> createState() => _UpcomingSessionsScreenState();
}

class _UpcomingSessionsScreenState extends State<UpcomingSessionsScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
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
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'Upcoming sessions',
                              style: ViewConfigTextStyles.headline6(ViewConfigColors.emphasisHigh),
                            ),
                          ),
                        ),
                      ],
                    ),
                    color: const Color(0xffffffff),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/flags/us.png',
                                            width: 28,
                                          ),
                                        ),
                                        decoration: BoxDecoration(color: ViewConfigColors.bg, borderRadius: BorderRadius.circular(10)),
                                        height: 52,
                                        width: 52,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: Column(
                                          children: [
                                            Text(
                                              '16 April, 2022',
                                              style: ViewConfigTextStyles.subtitle1(ViewConfigColors.emphasisHigh),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.flag_rounded,
                                                  color: ViewConfigColors.emphasisDisabled,
                                                  size: 18,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    'USA',
                                                    style: ViewConfigTextStyles.body2(ViewConfigColors.emphasisMedium),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(left: 36),
                                                  child: Icon(
                                                    Icons.place_rounded,
                                                    color: ViewConfigColors.emphasisDisabled,
                                                    size: 18,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    'California',
                                                    style: ViewConfigTextStyles.body2(ViewConfigColors.emphasisMedium),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                                  child: Container(
                                    color: ViewConfigColors.emphasisOutline,
                                    height: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/icon_time.svg',
                                        color: ViewConfigColors.emphasisDisabled,
                                        height: 18,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          '14:20 — 14:40 UTC +4',
                                          style: ViewConfigTextStyles.body2(ViewConfigColors.emphasisMedium),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      SvgPicture.asset(
                                        'assets/images/icon_map.svg',
                                        height: 24,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            height: 141,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/flags/gm.png',
                                            width: 28,
                                          ),
                                        ),
                                        decoration: BoxDecoration(color: ViewConfigColors.bg, borderRadius: BorderRadius.circular(10)),
                                        height: 52,
                                        width: 52,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: Column(
                                          children: [
                                            Text(
                                              '18 April, 2022',
                                              style: ViewConfigTextStyles.subtitle1(ViewConfigColors.emphasisHigh),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.flag_rounded,
                                                  color: ViewConfigColors.emphasisDisabled,
                                                  size: 18,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    'USA',
                                                    style: ViewConfigTextStyles.body2(ViewConfigColors.emphasisMedium),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(left: 36),
                                                  child: Icon(
                                                    Icons.place_rounded,
                                                    color: ViewConfigColors.emphasisDisabled,
                                                    size: 18,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    'California',
                                                    style: ViewConfigTextStyles.body2(ViewConfigColors.emphasisMedium),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                                  child: Container(
                                    color: ViewConfigColors.emphasisOutline,
                                    height: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/icon_time.svg',
                                        color: ViewConfigColors.emphasisDisabled,
                                        height: 18,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          '14:20 — 14:40 UTC +4',
                                          style: ViewConfigTextStyles.body2(ViewConfigColors.emphasisMedium),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      SvgPicture.asset(
                                        'assets/images/icon_map.svg',
                                        height: 24,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            height: 141,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/flags/ge.png',
                                            width: 28,
                                          ),
                                        ),
                                        decoration: BoxDecoration(color: ViewConfigColors.bg, borderRadius: BorderRadius.circular(10)),
                                        height: 52,
                                        width: 52,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: Column(
                                          children: [
                                            Text(
                                              '22 April, 2022',
                                              style: ViewConfigTextStyles.subtitle1(ViewConfigColors.emphasisHigh),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.flag_rounded,
                                                  color: ViewConfigColors.emphasisDisabled,
                                                  size: 18,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    'USA',
                                                    style: ViewConfigTextStyles.body2(ViewConfigColors.emphasisMedium),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(left: 36),
                                                  child: Icon(
                                                    Icons.place_rounded,
                                                    color: ViewConfigColors.emphasisDisabled,
                                                    size: 18,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    'California',
                                                    style: ViewConfigTextStyles.body2(ViewConfigColors.emphasisMedium),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                                  child: Container(
                                    color: ViewConfigColors.emphasisOutline,
                                    height: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/icon_time.svg',
                                        color: ViewConfigColors.emphasisDisabled,
                                        height: 18,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          '14:20 — 14:40 UTC +4',
                                          style: ViewConfigTextStyles.body2(ViewConfigColors.emphasisMedium),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      SvgPicture.asset(
                                        'assets/images/icon_map.svg',
                                        height: 24,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            height: 141,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/flags/gb.png',
                                            width: 28,
                                          ),
                                        ),
                                        decoration: BoxDecoration(color: ViewConfigColors.bg, borderRadius: BorderRadius.circular(10)),
                                        height: 52,
                                        width: 52,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: Column(
                                          children: [
                                            Text(
                                              '24 April, 2022',
                                              style: ViewConfigTextStyles.subtitle1(ViewConfigColors.emphasisHigh),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.flag_rounded,
                                                  color: ViewConfigColors.emphasisDisabled,
                                                  size: 18,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    'USA',
                                                    style: ViewConfigTextStyles.body2(ViewConfigColors.emphasisMedium),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(left: 36),
                                                  child: Icon(
                                                    Icons.place_rounded,
                                                    color: ViewConfigColors.emphasisDisabled,
                                                    size: 18,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    'California',
                                                    style: ViewConfigTextStyles.body2(ViewConfigColors.emphasisMedium),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                                  child: Container(
                                    color: ViewConfigColors.emphasisOutline,
                                    height: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/icon_time.svg',
                                        color: ViewConfigColors.emphasisDisabled,
                                        height: 18,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          '14:20 — 14:40 UTC +4',
                                          style: ViewConfigTextStyles.body2(ViewConfigColors.emphasisMedium),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      SvgPicture.asset(
                                        'assets/images/icon_map.svg',
                                        height: 24,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            height: 141,
                          ),
                        ),
                        Container(
                          height: 56 + 16 + 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 16),
                    child: Row(
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
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ),
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
