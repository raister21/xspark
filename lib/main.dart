import 'package:flutter/material.dart';
import 'package:xspark/presentation/router/router.dart';

void main() {
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
