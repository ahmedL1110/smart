import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_service/layout/layoutScreen.dart';
import 'package:smart_service/modules/on_Boarding/on_boarding.dart';
import 'package:smart_service/shared/components/constants.dart';

import '../Login/Login_Screen.dart';

class ScreenShot extends StatefulWidget {
  const ScreenShot({Key? key}) : super(key: key);

  @override
  State<ScreenShot> createState() => _ScreenShotState();
}

class _ScreenShotState extends State<ScreenShot> {
  @override
  void initState() {
    super.initState();
    loadPage();
  }

  loadPage() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OnBordingScreen() != null ? (uId != null ? LayoutScreen() : LoginScreen()) : OnBordingScreen()),
        ModalRoute.withName('/ScreenOne'));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.png',
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.4,
                  width: size.width * 0.4,
                  child: const Center(
                    child: Image(
                      image: AssetImage(
                        'assets/images/smart.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}