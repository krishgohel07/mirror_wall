import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/model/web_model.dart';

class websiteProvider extends ChangeNotifier {
  InAppWebViewController? inAppWebViewController;
  PullToRefreshController? pullToRefreshController;
  List<WebModel> educationalwebsites = [
    WebModel(WebURL: 'https://www.wikipedia.org/', WebName: 'WikiPedia'),
    WebModel(WebURL: 'https://www.w3schools.com/', WebName: 'W3School'),
    WebModel(WebURL: 'https://www.javatpoint.com/', WebName: 'Java Point'),
    WebModel(WebURL: 'https://stackoverflow.com/', WebName: 'Stack Overflow')
  ];

  void webviewcontroller(controller) {
    inAppWebViewController = controller;
    notifyListeners();
  }

  void refresh() {
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(color: Color(0xffF44336)),
      onRefresh: () {
        inAppWebViewController!.reload();
      },
    );
    notifyListeners();
  }

  Future<void> homepage(String uri) async {
    await inAppWebViewController!
        .loadUrl(urlRequest: URLRequest(url: Uri.parse(uri)));
  }

  Future<void> refreshh() async{
    await inAppWebViewController!.reload();
  }

  forward() async {
    if (await inAppWebViewController!.canGoForward()) {
      await inAppWebViewController!.goForward();
    }
    notifyListeners();
  }

  backward() async {
    if (await inAppWebViewController!.canGoBack()) {
      await inAppWebViewController!.goBack();
      notifyListeners();
    }
  }

  void stoprefresh() {
    pullToRefreshController!.endRefreshing();
    notifyListeners();
  }
}
