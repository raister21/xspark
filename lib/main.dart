import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xspark/presentation/router/router.dart';
import 'package:xspark/utility/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RouteGenerator _routeGenerator = RouteGenerator();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X-Spark',
      theme: ThemeData(primarySwatch: Colors.orange),
      onGenerateRoute: _routeGenerator.generateRoute,
    );
  }
}
