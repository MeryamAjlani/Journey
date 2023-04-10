import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProgressChart extends StatefulWidget {
  const ProgressChart(
      {Key? key, required this.numFinished, required this.numUnfinished})
      : super(key: key);
  final double numFinished;
  final double numUnfinished;
  @override
  State<ProgressChart> createState() => _ProgressChartState();
}

class _ProgressChartState extends State<ProgressChart> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Finished', widget.numFinished, ColorPalette.lightGreen),
      ChartData('Unfinished', widget.numUnfinished, ColorPalette.lightPink),
    ];
    return Center(
      child: SizedBox(
        height: 300,
        child: SfCircularChart(
            legend: Legend(
                isVisible: true,
                textStyle: TextStyle(color: Colors.white),
                iconHeight: 20,
                iconWidth: 20),
            series: <CircularSeries>[
          // Renders doughnut chart
          DoughnutSeries<ChartData, String>(
              dataSource: chartData,
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color = Colors.white]);
  final String x;
  final double y;
  final Color color;
}
