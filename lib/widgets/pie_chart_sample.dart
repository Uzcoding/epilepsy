import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimplePieChart extends StatelessWidget {
  final bool animate;
  final statisticsData;
  final title;

  SimplePieChart(this.statisticsData, {this.animate, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xffedeef2),
        boxShadow: [
          BoxShadow(
            color: const Color(0x3924415d),
            offset: Offset(2, 2),
            blurRadius: 3,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xffeaebf3),
          boxShadow: [
            BoxShadow(
              color: const Color(0xb2ffffff),
              offset: Offset(-2, -2),
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'SF UI Display',
                fontSize: 16,
                color: const Color(0xff0e3062),
                letterSpacing: 0.004480000019073486,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
            Container(
              height: 300,
              margin: EdgeInsets.only(top: 15),
              child: charts.PieChart(
                _createSampleData(),
                animate: animate,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = List.generate(
      statisticsData.labels.length,
      (index) => OrdinalSales(
        statisticsData.labels[index],
        statisticsData.data[index],
      ),
    );

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.label,
        measureFn: (OrdinalSales sales, _) => sales.data,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class StatisticsData {
  List<String> labels;
  List<int> data;
}

class OrdinalSales {
  final String label;
  final int data;

  OrdinalSales(this.label, this.data);
}
