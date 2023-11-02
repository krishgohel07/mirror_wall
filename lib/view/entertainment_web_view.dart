import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/model/entertainment_model.dart';
import 'package:mirror_wall/provider/entertainment_provider.dart';
import 'package:provider/provider.dart';

class SecondWebView extends StatefulWidget {
  const SecondWebView({super.key});

  @override
  State<SecondWebView> createState() => _SecondWebViewState();
}

class _SecondWebViewState extends State<SecondWebView> {
  @override
  Widget build(BuildContext context) {
    var entertainmentt=Provider.of<entertainmentprovider>(context);
    var entertainmenttfalse=Provider.of<entertainmentprovider>(context,listen: false);
    EntertainmentModel entertainment = ModalRoute
        .of(context)!
        .settings
        .arguments as EntertainmentModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(entertainment.name),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(entertainment.webURL)),
        pullToRefreshController: entertainmentt.pullToRefreshController,
        onLoadStop:(controller,uri){
          entertainmenttfalse.stoprefresh();
        },
        onLoadStart:(controller,uri){
          entertainmenttfalse.webviewcontroller(controller);
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async{
              await entertainmenttfalse.backward();
            }, child: Icon(Icons.arrow_back_ios_rounded),),
          FloatingActionButton(
            onPressed: () async{
              await entertainmenttfalse.forward();
            }, child: Icon(Icons.arrow_forward_ios_rounded),),
          FloatingActionButton(
            onPressed: () async{
               await entertainmenttfalse.refreshh();
            }, child: Icon(Icons.refresh),),
          FloatingActionButton(
            onPressed: () async{
              await entertainmenttfalse.homepage(entertainment.webURL);
            }, child: Icon(Icons.home),)
        ],
      ),
    );
  }
}
