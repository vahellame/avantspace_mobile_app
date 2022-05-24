import 'package:flutter/cupertino.dart';

enum CurrentBottomNavigationPanelPage { ar, map, upcomingSessions, faq }

class BottomNavigationPanelModel with ChangeNotifier {
  BottomNavigationPanelModel();

  late CurrentBottomNavigationPanelPage _currentBottomNavigationPanelPage;

  CurrentBottomNavigationPanelPage get currentBottomNavigationPanelPage => _currentBottomNavigationPanelPage;

  Future<void> init() async {
    _currentBottomNavigationPanelPage = CurrentBottomNavigationPanelPage.ar;
  }

  void setCurrentBottomNavigationPanelPage(CurrentBottomNavigationPanelPage value) {
    _currentBottomNavigationPanelPage = value;
    notifyListeners();
  }
}
