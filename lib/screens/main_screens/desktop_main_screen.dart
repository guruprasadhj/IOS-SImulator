import 'package:flutter/material.dart';
class DesktopViewMainScreen extends StatefulWidget {
  const DesktopViewMainScreen({Key? key}) : super(key: key);

  @override
  State<DesktopViewMainScreen> createState() => _DesktopViewMainScreenState();
}

class _DesktopViewMainScreenState extends State<DesktopViewMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}
