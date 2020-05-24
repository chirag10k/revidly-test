import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revidlytest/screens/authentication/onboarding_screen.dart';
import 'package:revidlytest/screens/authentication/wrapper.dart';
import 'package:revidlytest/services/api_service.dart';
import 'package:revidlytest/services/connectivity_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(
          value: ConnectivityService().onConnectivityChanged,
        ),
        ChangeNotifierProvider.value(
          value: ApiService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
      ),
    );
  }
}
