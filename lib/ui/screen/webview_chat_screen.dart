import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewChatScreen extends StatefulWidget {
  @override
  State<WebviewChatScreen> createState() => _WebviewChatScreenState();
}

class _WebviewChatScreenState extends State<WebviewChatScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
          Uri.parse('https://tawk.to/chat/67adf5b33a842732607e4f31/1ijvofhfh'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live Chat')),
      body: WebViewWidget(controller: controller),
    );
  }
}
