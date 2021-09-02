import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;
  BarChart({Key key, this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });

    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Column(children: [
        Text(
          "Weekly Spending",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
              iconSize: 30.0,
            ),
            Text("Aug 31, 2021 - Sep 01, 2021",
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward),
              iconSize: 30.0,
            )
          ],
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Bar(
                label: "Mon",
                amountSpent: expenses[0],
                mostExpensive: mostExpensive),
            Bar(
                label: "Tue",
                amountSpent: expenses[1],
                mostExpensive: mostExpensive),
            Bar(
                label: "Wed",
                amountSpent: expenses[2],
                mostExpensive: mostExpensive),
            Bar(
                label: "Thu",
                amountSpent: expenses[3],
                mostExpensive: mostExpensive),
            Bar(
                label: "Fri",
                amountSpent: expenses[4],
                mostExpensive: mostExpensive),
            Bar(
                label: "Sat",
                amountSpent: expenses[5],
                mostExpensive: mostExpensive),
            Bar(
                label: "Sun",
                amountSpent: expenses[6],
                mostExpensive: mostExpensive),
          ],
        )
      ]),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final num amountSpent;
  final num mostExpensive;

  final double _maxBarHeight = 150.0;

  const Bar({Key key, this.label, this.amountSpent, this.mostExpensive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text("\$${amountSpent.toStringAsFixed(2)}",
            style: TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(height: 6.0),
        Container(
          width: 18.0,
          height: _barHeight,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(6.0)),
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
        )
      ],
    );
  }
}
