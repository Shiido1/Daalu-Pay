import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class WebviewChatScreen extends StatefulWidget {
  WebviewChatScreen({super.key});

  @override
  State<WebviewChatScreen> createState() => _WebviewChatScreenState();
}

class _WebviewChatScreenState extends State<WebviewChatScreen> {
  WebViewController? chatController;

  @override
  void initState() {
    super.initState();
    chatController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(
                'https://tawk.to/chat/67adf5b33a842732607e4f31/1ijvofhfh')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          Uri.parse('https://tawk.to/chat/67adf5b33a842732607e4f31/1ijvofhfh'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: WebviewScaffold(
          url: "https://tawk.to/chat/67adf5b33a842732607e4f31/1ijvofhfh",
          appBar: new AppBar(
            title: new Text("Widget webview"),
          ),
        ),
      ),
    );
  }
}
