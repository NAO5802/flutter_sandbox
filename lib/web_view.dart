import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress){
          // update loading bar
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        // onNavigationRequest: (NavigationRequest request) {},
      )
    )
    ..loadRequest(Uri.parse('https://flutter.dev/'));


class MyWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter web view'),),
      body: WebViewWidget(controller: controller),
    );
  }

}
