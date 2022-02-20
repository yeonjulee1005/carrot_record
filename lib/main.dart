import 'package:beamer/beamer.dart';
import 'package:carrot_record/router/locations.dart';
import 'package:carrot_record/screens/auth_screen.dart';
import 'package:carrot_record/screens/splash_screen.dart';
import 'package:carrot_record/utils/logger.dart';
import 'package:flutter/material.dart';

final _routerDelegate = BeamerDelegate(
  guards: [
    BeamGuard(
        pathBlueprints: [
          '/',
        ],
        check: (context, location) {
          return false;
        }, showPage: BeamPage(
            child: AuthScreen()
          )
    )
  ],
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        HomeLocation()
      ]
    ));

void main() {
  logger.d('my first log by logger');
  runApp(CarrotRecord());
}

class CarrotRecord extends StatelessWidget {
  const CarrotRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future: Future.delayed(
          Duration(seconds: 3),
          () => 100
      ),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: _splashLoadingWidget(snapshot));
      }
    );
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if(snapshot.hasError) {
      print('error occur while loading');
      return Text('error occured');
    } else if (snapshot.hasData) {
      return CarrotApp();
    } else {
      return SplashScreen();
    }
  }
}

class CarrotApp extends StatelessWidget {
  const CarrotApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: BeamerParser(),
        routerDelegate: _routerDelegate);
  }
}
