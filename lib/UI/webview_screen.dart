import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webview_screen extends StatefulWidget {
  const webview_screen({super.key});

  @override
  State<webview_screen> createState() => _webview_screenState();
}

class _webview_screenState extends State<webview_screen> {
  //creating web view controller
  late final WebViewController controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(onPageStarted: (url) {
        setState(() {
          loadingPercentage = 0;
        });
      }, onProgress: (progress) {
        setState(() {
          loadingPercentage = progress;
        });
      }, onPageFinished: (url) {
        setState(() {
          loadingPercentage = 100;
        });
      }))
      ..loadRequest(Uri.parse('https://flutter.dev/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebView"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
