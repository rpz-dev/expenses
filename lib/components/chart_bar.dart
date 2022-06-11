import 'package:flutter/material.dart';
import 'chart.dart';
class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  ChartBar(this.label, this.value, this.percentage);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('R\$${value.toStringAsFixed(2)}'),
        SizedBox(height: 5,),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(200, 220, 200, 1),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),
        Text(label),
      ],
    );
  }
}