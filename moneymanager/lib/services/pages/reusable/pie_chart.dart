import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Chart extends StatelessWidget {
  const Chart({required this.dataMap, Key? key, required this.name})
      : super(key: key);
  final dataMap;
  final name;

  @override
  Widget build(BuildContext context) {
    dataMap.remove('total');
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(microseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 1.5,
      colorList: [
        Colors.green,
        Colors.blue,
        Colors.orange,
        Colors.purple,
        Colors.brown,
      ],
      initialAngleInDegree: 0,
      ringStrokeWidth: 32,
      legendOptions: LegendOptions(showLegends: false),
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
