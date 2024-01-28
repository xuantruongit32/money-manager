import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Chart extends StatelessWidget {
  const Chart({required this.dataMap, Key? key, required this.name})
      : super(key: key);
  final dataMap;
  final name;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(microseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: [
        Colors.blue,
        Colors.red,
        Colors.purple,
        Colors.brown,
        Colors.orange,
        Colors.amber
      ],
      initialAngleInDegree: 0,
      ringStrokeWidth: 32,
      legendOptions: LegendOptions(
        showLegendsInRow: true,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
    );
  }
}
