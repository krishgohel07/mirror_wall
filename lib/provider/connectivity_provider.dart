import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mirror_wall/model/connectivity_model.dart';

class ConnectivityProvider extends ChangeNotifier {
  ConnectivityModel connectivityModel = ConnectivityModel(
      ConnectivityStatus: 'Offline');
  Connectivity connectivity = Connectivity();
  void CheckConnectivity(){
    connectivity.onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      if(connectivityResult==ConnectivityResult.mobile || connectivityResult==ConnectivityResult.wifi){
        connectivityModel.ConnectivityStatus='Online';
        notifyListeners();
      }
      else{
        connectivityModel.ConnectivityStatus='Offline';
        notifyListeners();
      }
    });
  }


}