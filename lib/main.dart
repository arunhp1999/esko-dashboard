import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/metrics_provider.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          MetricsProvider()..loadSummary("MobileApp"), // 👈 use MetricsProvider
      child: MaterialApp(
        title: 'Esko Dashboard',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: DashboardScreen(),
      ),
    );
  }
}
