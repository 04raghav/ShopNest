import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shopnest/features/admin/models/sales.dart';

class CategoryProductsChart extends StatefulWidget {
  final List<Sales> data;
  final double totalSales; // from API

  const CategoryProductsChart({
    Key? key,
    required this.data,
    required this.totalSales,
  }) : super(key: key);

  @override
  State<CategoryProductsChart> createState() => _CategoryProductsChartState();
}

class _CategoryProductsChartState extends State<CategoryProductsChart> {
  int? _touchedIndex;

  final Map<String, Color> categoryColors = {
    'Mobiles': Colors.blue,
    'Appliances': Colors.green,
    'Essentials': Colors.orange,
    'Books': Colors.purple,
    'Fashion': Colors.pink,
  };

  @override
  Widget build(BuildContext context) {
    final filteredData = widget.data.where((s) => s.earning > 0).toList();
    final double actualTotal = filteredData.fold(0.0, (sum, item) => sum + item.earning);

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 280,
              child: PieChart(
                PieChartData(
                  sections: _getSections(filteredData, actualTotal),
                  centerSpaceRadius: 60,
                  sectionsSpace: 2,
                  borderData: FlBorderData(show: false),
                  pieTouchData: PieTouchData(
                    touchCallback: (event, response) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            response == null ||
                            response.touchedSection == null) {
                          _touchedIndex = null;
                          return;
                        }
                        _touchedIndex = response.touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                Text(
                  '\$${actualTotal.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Horizontal scrollable legend
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: categoryColors.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: entry.value,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      entry.key,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'API Total: \$${widget.totalSales.toStringAsFixed(0)}',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  List<PieChartSectionData> _getSections(List<Sales> data, double actualTotal) {
    return data.asMap().entries.map((entry) {
      final index = entry.key;
      final sales = entry.value;
      final isTouched = _touchedIndex == index;
      final color = categoryColors[sales.label] ?? Colors.grey;

      return PieChartSectionData(
        color: color,
        value: sales.earning.toDouble(),
        title: isTouched
            ? '\$${sales.earning.toStringAsFixed(0)}'
            : '${(sales.earning / actualTotal * 100).toStringAsFixed(1)}%',
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        radius: isTouched ? 90 : 80,
      );
    }).toList();
  }
}
