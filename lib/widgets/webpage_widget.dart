import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/widgets/navbar.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'appbar.dart';

class WeblinkWidget extends StatefulWidget {
  WeblinkWidget({super.key, required this.webLink, required this.showAppbar});

  String webLink;
  bool showAppbar = true;

  @override
  State<WeblinkWidget> createState() => _WeblinkWidgetState();
}

class _WeblinkWidgetState extends State<WeblinkWidget> {
  late final WebViewController controller;

  var loadingPercentage = 0;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse(widget.webLink),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: widget.showAppbar == true
          ? AppBarWidget(text: "")
          : AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  color: ThemeConstents.appBodyBlack,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
              elevation: 0,
              title: Text("",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: ThemeConstents.appBodyBlack)),
            ),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: controller),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                  value: loadingPercentage / 100.0,
                  minHeight: 10,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.green)),
          ],
        ),
      ),
    );
  }
}
