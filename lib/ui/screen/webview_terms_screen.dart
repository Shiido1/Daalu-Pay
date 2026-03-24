import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewTermsScreen extends StatefulWidget {
  const WebviewTermsScreen({super.key});

  @override
  State<WebviewTermsScreen> createState() => _WebviewTermsScreenState();
}

class _WebviewTermsScreenState extends State<WebviewTermsScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
          Uri.parse('https://daalupay.com/terms'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terms and condition')),
      body: WebViewWidget(controller: controller),
    );
  }
}
