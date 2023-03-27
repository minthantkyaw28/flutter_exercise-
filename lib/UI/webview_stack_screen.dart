import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webview_stack_screen extends StatefulWidget {
  const webview_stack_screen({super.key});

  @override
  State<webview_stack_screen> createState() => _webview_stack_screenState();
}

class _webview_stack_screenState extends State<webview_stack_screen> {
  //creating web view controller
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
          loadingPercentage = 100;
        },
        onWebResourceError: (error) {
          Container(
            margin: EdgeInsets.symmetric(),
            child: Text("Network Error"),
          );
        },
      ))
      ..loadRequest(Uri.parse("https://flutter.dev/"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Stack(
          children: [
            WebViewWidget(controller: controller),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
              ),
          ],
        ));
  }
}
