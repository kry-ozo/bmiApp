import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:weather_app/models/bmi_data.dart';

class ChartLine extends StatelessWidget {
  final List<BmiData> bmiHistory;
  const ChartLine({super.key, required this.bmiHistory});
  
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 350,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: LineChart(
          LineChartData(
            maxY: 63.0,
            minY: 12.0,
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 50),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  interval: Duration(days: 30).inMilliseconds.toDouble(),
                  showTitles: false,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                    return Text("${date.month}/${date.year}");
                  },
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false, reservedSize: 30)),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false))
            ),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: bmiHistory
                    .map((data) =>
                        FlSpot(data.date.millisecondsSinceEpoch.toDouble(), data.bmi))
                    .toList(),
                isCurved: true,
                barWidth: 4,
                dotData: const FlDotData(show: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}