import 'package:avantspace_mobile_app/views/view_config.dart';
import 'package:avantspace_mobile_app/views/widgets/bottom_navigation_panel.dart';
import 'package:avantspace_mobile_app/views/widgets/custom_burger_button.dart';
import 'package:avantspace_mobile_app/views/widgets/custom_expansion_tile.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    color: const Color(0xffffffff),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'Frequently Asked Questions',
                              style: ViewConfigTextStyles.headline6(ViewConfigColors.emphasisHigh),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 64,
                        color: ViewConfigColors.bg,
                      ),
                      TabBar(
                        tabs: [
                          for (int i = 1; i <= 10; i++)
                            Tab(
                              height: 32,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: ViewConfigColors.primary700, width: 1),
                                  borderRadius: const BorderRadius.all(Radius.circular(32)),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    child: Text('Module $i'),
                                  ),
                                ),
                              ),
                            ),
                        ],
                        indicator: BoxDecoration(
                          border: Border.all(color: ViewConfigColors.primary700, width: 1),
                          borderRadius: const BorderRadius.all(Radius.circular(32)),
                          color: ViewConfigColors.primary700,
                        ),
                        indicatorWeight: 0.0,
                        indicatorColor: Colors.transparent,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Colors.white,
                        unselectedLabelColor: ViewConfigColors.primary700,
                        automaticIndicatorColorAdjustment: true,
                        isScrollable: true,
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                        indicatorPadding: EdgeInsets.zero,
                        labelStyle: ViewConfigTextStyles.body2(ViewConfigColors.primary700),
                        unselectedLabelStyle: ViewConfigTextStyles.body2(ViewConfigColors.primary700),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        for (int i = 0; i < 10; i++)
                          ListView(
                            children: [
                              Column(
                                children: [
                                  for (int i = 0; i < 10; i++)
                                    CustomExpansionTile(
                                      title: Text(
                                        'What is Avant Space?',
                                        style: ViewConfigTextStyles.subtitle1(ViewConfigColors.emphasisHigh),
                                      ),
                                      tilePadding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                                      iconColor: ViewConfigColors.emphasisMedium,
                                      collapsedIconColor: ViewConfigColors.emphasisMedium,
                                      children: <Widget>[
                                        ListTile(
                                          title: Text(
                                            'Unique technology.A group of microsatellites are equipped with a laser system for projecting images in the night sky. It works as a QR code in space.',
                                            style: ViewConfigTextStyles.body2(ViewConfigColors.emphasisHigh),
                                          ),
                                          contentPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                                        ),
                                      ],
                                    ),
                                  Container(height: 88, color: ViewConfigColors.bg),
                                ],
                              ),
                            ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16, bottom: 16),
                        child: CustomBurgerButton(
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
