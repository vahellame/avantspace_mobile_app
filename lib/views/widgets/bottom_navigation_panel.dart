import 'package:avantspace_mobile_app/logic/bottom_navigation_panel.dart';
import 'package:avantspace_mobile_app/views/view_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationPanel extends StatelessWidget {
  const BottomNavigationPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CurrentBottomNavigationPanelPage currentBottomNavigationPanelPage = context.watch<BottomNavigationPanelModel>().currentBottomNavigationPanelPage;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      height: 280,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ViewConfigColors.emphasisDisabled,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  height: 4,
                  width: 38,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  context.read<BottomNavigationPanelModel>().setCurrentBottomNavigationPanelPage(CurrentBottomNavigationPanelPage.ar);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/home');
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: currentBottomNavigationPanelPage == CurrentBottomNavigationPanelPage.ar ? ViewConfigColors.primaryOverlaySelected : Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/bottom_navigation_panel/ar.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Augmented reality',
                          style: ViewConfigTextStyles.subtitle1(ViewConfigColors.emphasisHigh),
                        ),
                      ),
                      Expanded(child: Container()),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.navigate_next_rounded,
                          size: 24,
                          color: ViewConfigColors.emphasisDisabled,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  context.read<BottomNavigationPanelModel>().setCurrentBottomNavigationPanelPage(CurrentBottomNavigationPanelPage.map);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/map');
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: currentBottomNavigationPanelPage == CurrentBottomNavigationPanelPage.map ? ViewConfigColors.primaryOverlaySelected : Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/bottom_navigation_panel/map.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Map',
                          style: ViewConfigTextStyles.subtitle1(ViewConfigColors.emphasisHigh),
                        ),
                      ),
                      Expanded(child: Container()),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.navigate_next_rounded,
                          size: 24,
                          color: ViewConfigColors.emphasisDisabled,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  context.read<BottomNavigationPanelModel>().setCurrentBottomNavigationPanelPage(CurrentBottomNavigationPanelPage.upcomingSessions);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/upcoming_sessions');
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: currentBottomNavigationPanelPage == CurrentBottomNavigationPanelPage.upcomingSessions ? ViewConfigColors.primaryOverlaySelected : Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/bottom_navigation_panel/upcoming_sessions.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Upcoming sessions',
                          style: ViewConfigTextStyles.subtitle1(ViewConfigColors.emphasisHigh),
                        ),
                      ),
                      Expanded(child: Container()),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.navigate_next_rounded,
                          size: 24,
                          color: ViewConfigColors.emphasisDisabled,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 8),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  context.read<BottomNavigationPanelModel>().setCurrentBottomNavigationPanelPage(CurrentBottomNavigationPanelPage.faq);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/faq');
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: currentBottomNavigationPanelPage == CurrentBottomNavigationPanelPage.faq ? ViewConfigColors.primaryOverlaySelected : Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/bottom_navigation_panel/faq.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'FAQ',
                          style: ViewConfigTextStyles.subtitle1(ViewConfigColors.emphasisHigh),
                        ),
                      ),
                      Expanded(child: Container()),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.navigate_next_rounded,
                          size: 24,
                          color: ViewConfigColors.emphasisDisabled,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
