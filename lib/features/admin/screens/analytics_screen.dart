import 'package:flutter/material.dart';
import 'package:shopnest/Common/loader.dart';
import 'package:shopnest/features/admin/models/sales.dart';
import 'package:shopnest/features/admin/services/admin_services.dart';
import 'package:shopnest/features/admin/widgets/category_products_chart.dart';


class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  void getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return earnings == null || totalSales == null
        ? const Loader()
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Sales',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                    height: 600,
                    child: 
                    CategoryProductsChart(
                      totalSales: totalSales!.toDouble(),
                      data: earnings!),
                    ),
              ],
            ),
          );
  }
}
