import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/model/entertainment_model.dart';

class entertainmentprovider extends ChangeNotifier{
  InAppWebViewController? inAppWebViewController;
  PullToRefreshController? pullToRefreshController;
  List<EntertainmentModel> entertainmentweb=[
    EntertainmentModel(name: 'Netflix', webURL: 'https://www.netflix.com/in/'),
    EntertainmentModel(name: 'Amazon Prime', webURL: 'https://www.primevideo.com/'),
    EntertainmentModel(name: 'Disney+ Hotstar', webURL: 'https://www.hotstar.com/'),
    EntertainmentModel(name: 'Sony Liv', webURL: 'https://www.sonyliv.com/')
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

  Future<void> refreshh() async{
    await inAppWebViewController!.reload();
  }

  Future<void> homepage(String uri) async {
    await inAppWebViewController!
        .loadUrl(urlRequest: URLRequest(url: Uri.parse(uri)));
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