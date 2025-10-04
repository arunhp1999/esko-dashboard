import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/metrics_provider.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MetricsProvider>(context);

    if (provider.isLoading)
      return Scaffold(body: Center(child: CircularProgressIndicator()));

    final s = provider.summary;
    if (s == null) return Scaffold(body: Center(child: Text('No metrics')));

    final sections = s.topFeatures.entries.map((e) {
      return PieChartSectionData(
        value: e.value.toDouble(),
        title: e.key,
        radius: 50,
        titleStyle: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Esko Dashboard - ${s.product}')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('Active time (mins)'),
                trailing: Text('${s.totalActiveMinutes.toStringAsFixed(1)}'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Idle %'),
                trailing: Text('${s.idlePercentage}%'),
              ),
            ),
            SizedBox(height: 16),
            Text('Top Features',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            SizedBox(
                height: 250, child: PieChart(PieChartData(sections: sections))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.loadSummary('MobileApp'), // product name
        child: Icon(Icons.refresh),
      ),
    );
  }
}
