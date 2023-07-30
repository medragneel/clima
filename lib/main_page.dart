import 'package:clima/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'utils/constants.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    home: Scaffold(
    backgroundColor: mainColor,
        body: SafeArea(
            child: LoadingScreen(),

            ),
    ),
    );
  }
}
