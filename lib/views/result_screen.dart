import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.age,
    required this.height,
    required this.weight,
  });
  final int age;
  final double height;
  final double weight;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    double BMI = widget.weight / (widget.height / 100 * widget.height / 100);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Result", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Your Result is", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("BMI Value: ${BMI.toStringAsFixed(1)}"),
            Text("Health Status: ${healthStatus(BMI)}"),
          ],
        ),
      ),
    );
  }
}

String healthStatus(double BMI) {
  if (BMI < 18.5) {
    return "Underweight";
  } else if (BMI >= 18.5 && BMI < 25) {
    return "Normal weight";
  } else if (BMI >= 25 && BMI < 30) {
    return "Overweight";
  } else {
    return "Obesity";
  }
}