import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.day == weekDay.month;
        bool sameYear = recentTransactions[i].date.day == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum = recentTransactions[i].value;
        }
      }
      return {'day': DateFormat.E().format(weekDay)[0], 'value': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((tr) {
          return ChartBar(label: tr['day'], value: tr['value'], percentage: 0);
        }).toList(),
      ),
    );
  }
}
