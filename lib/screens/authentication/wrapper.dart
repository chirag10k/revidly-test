import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revidlytest/enums/connectivity_status.dart';
import 'package:revidlytest/screens/home/home_screen.dart';
import '../offline_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final connectionStatus = Provider.of<ConnectivityStatus>(context);
//    return either Home or Offline Screen
    if(connectionStatus == ConnectivityStatus.Offline)
      return OfflineScreen();
    else if(connectionStatus != ConnectivityStatus.Offline)
      return HomeScreen();
  }
}
