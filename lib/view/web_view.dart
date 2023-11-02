import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/model/entertainment_model.dart';
import 'package:mirror_wall/model/web_model.dart';
import 'package:mirror_wall/provider/webiste_provider.dart';
import 'package:provider/provider.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    var webproider = Provider.of<websiteProvider>(context);
    var webproiderfalse = Provider.of<websiteProvider>(context, listen: false);
    WebModel education = ModalRoute.of(context)!.settings.arguments as WebModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(education.WebName),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(education.WebURL)),
        pullToRefreshController: webproider.pullToRefreshController,
        onLoadStop: (controller, uri) {
          webproiderfalse.stoprefresh();
        },
        onLoadStart: (controller, uri) {
          webproiderfalse.webviewcontroller(controller);
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async{
              await webproiderfalse.backward();
            },
            child: Icon(Icons.arrow_back_ios_rounded),
          ),
          FloatingActionButton(
            onPressed: () async{
              await webproiderfalse.forward();
            },
            child: Icon(Icons.arrow_forward_ios_rounded),
          ),
          FloatingActionButton(
            onPressed: () async{
              await webproiderfalse.refreshh();
            },
            child: Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: () async{
              await webproider.homepage(education.WebURL);
            },
            child: Icon(Icons.home),
          )
        ],
      ),
    );
  }
}
