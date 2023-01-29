import 'package:flutter/material.dart';

import '../responsive/responsive_layout.dart';
import 'main_screens/desktop_main_screen.dart';
import 'main_screens/mobile_main_screen.dart';


class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileViewMainScreen(), desktopBody: MobileViewMainScreen(),//DesktopViewMainScreen(),

      ),
    );
  }
}
