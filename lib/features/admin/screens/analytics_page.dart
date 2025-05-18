import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesData = [
      {'category': 'Mobiles', 'value': 35.0, 'color': Colors.blue},
      {'category': 'Appliances', 'value': 25.0, 'color': Colors.orange},
      {'category': 'Books', 'value': 15.0, 'color': Colors.green},
      {'category': 'Fashion', 'value': 25.0, 'color': Colors.purple},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              '\$12345', // Static total sales
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Category-wise Sales Distribution',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: PieChart(
                PieChartData(
                  sections: salesData.map((data) {
                    return PieChartSectionData(
                      color: data['color'] as Color,
                      value: data['value'] as double,
                      title: '${data['value']}%',
                      radius: 50,
                      titleStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }).toList(),
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Legend
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: salesData.map((data) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        color: data['color'] as Color,
                      ),
                      const SizedBox(width: 8),
                      Text(data['category'] as String),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
