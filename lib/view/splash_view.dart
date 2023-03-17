import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_una/helper/secure_storage.dart';
import 'package:video_player/video_player.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late VideoPlayerController _controller;
  bool _visible = false;

  @override
  void initState() {
    SecureStore.checkLogin(context);
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset("lib/videos/videouna.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(const Duration(seconds: 10), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });

    // Future.delayed(const Duration(seconds: 30), () {
    //   // Navigator.pushAndRemoveUntil(
    //   //     context,
    //   //     MaterialPageRoute(
    //   //         builder: (context) => HomePage(param_homepage: 'Welcome Home')),
    //   //     (e) => false);
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 100),
      child: VideoPlayer(_controller),
    );
  }

  _getBackgroundColor() {
    return Container(color: Colors.transparent //.withAlpha(120),
        );
  }

  _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            _getVideoBackground(),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:project_una/helper/secure_storage.dart';
// import 'package:project_una/view/signin_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   // VideoPlayerController? controllerVideo;

//   @override
//   void initState() {
//     SecureStore.checkLogin(context);

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: Stack(
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('images/Splash.png'), fit: BoxFit.fill),
//                 ),
//               ),
//               // Container(
//               //   height: 50,
//               //   width: 150,
//               //   decoration: const BoxDecoration(
//               //     image: DecorationImage(
//               //         image: AssetImage('images/splash.png'),
//               //         fit: BoxFit.fitWidth),
//               //   ),
//               // ),
//               // Positioned(
//               //   bottom: 1,
//               //   child: Container(
//               //     height: 250,
//               //     child: FooterWidget(),
//               //   ),
//               // ),
//               // Container(
//               //   height: 250,
//               //   child: HeaderWidget(250),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Future<void> checkLoin(BuildContext context) async {
//   //   final login = await SharedPreferences.getInstance();
//   //   String? user = login.getString("phone");
//   //   if (user == null || user.isEmpty) {
//   //     gotonextpage(context);
//   //   } else {
//   //     // Navigator.of(context).pushAndRemoveUntil(
//   //     //     MaterialPageRoute(
//   //     //       builder: (ctx) => HomeScreen(),
//   //     //     ),
//   //     //     (route) => false);
//   //   }
//   // }

//   // Future<void> gotonextpage(BuildContext context) async {
//   //   await Future.delayed(const Duration(seconds: 3));
//   //   Navigator.of(context).pushAndRemoveUntil(
//   //       MaterialPageRoute(
//   //         builder: (ctx) => const SignInScreen(),
//   //       ),
//   //       (route) => false);
//   // }
// }
