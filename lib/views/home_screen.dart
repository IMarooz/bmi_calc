import 'package:bmi_calc/widgets/calculate_button.dart';
import 'package:bmi_calc/widgets/details_card.dart';
import 'package:bmi_calc/widgets/gender_cards.dart';
import 'package:bmi_calc/widgets/height_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  double height = 170;
  double weight = 70;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          GenderCards(
            isMale: isMale,
            onChanged: (v) => setState(() => isMale = v),
          ),
          HeightCard(
            height: height,
            onChanged: (v) => setState(() => height = v),
          ),
          DetailsCard(
            age: age,
            weight: weight,
            onAgeChanged: (v) => setState(() => age = v),
            onWeightChanged: (v) => setState(() => weight = v),
          ),
          CalculateButton(
            age: age,
            height: height,
            weight: weight,
            isMale: isMale,
          ),
        ],
      ),
    );
  }
}
