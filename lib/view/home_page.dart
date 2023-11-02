import 'package:flutter/material.dart';
import 'package:mirror_wall/provider/connectivity_provider.dart';
import 'package:mirror_wall/provider/entertainment_provider.dart';
import 'package:mirror_wall/provider/webiste_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false)
        .CheckConnectivity();
  }
  @override
  Widget build(BuildContext context) {
    var website = Provider.of<websiteProvider>(context);
    var websitefalse = Provider.of<websiteProvider>(context, listen: false);
    var entertaiment = Provider.of<entertainmentprovider>(context);
    var entertaimentfalse =
        Provider.of<entertainmentprovider>(context, listen: false);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Mirror Wall"),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Tab(
                text: 'Education',
              ),
              Tab(
                text: 'Entertainment',
              )
            ]),
          ),
          body: (Provider.of<ConnectivityProvider>(context)
                      .connectivityModel
                      .ConnectivityStatus ==
                  'Offline')
              ? Center(child: Text("You are Offline"),)
              : TabBarView(children: [
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: websitefalse.educationalwebsites.map((e) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(18),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.red, width: 1),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('webpage', arguments: e);
                              },
                              child: Text(
                                e.WebName,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: entertaimentfalse.entertainmentweb.map((e) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(18),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.red, width: 1),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('entertainment', arguments: e);
                              },
                              child: Text(
                                e.name,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ]),
        ));
  }
}
