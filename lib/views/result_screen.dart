import 'package:bmi_calc/constants/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    double BMI = weight / (height / 100 * height / 100);
    final String status = healthStatus(BMI);
    final Color statusColor = getStatusColor(BMI);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Your Result",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: purpleColor,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // Main BMI Value Card
                Container(
                  width: 280,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: statusColor.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        BMI.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        status,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                // Details Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDetailCard(
                      "Height",
                      "${height.toStringAsFixed(0)} cm",
                      heightColor,
                    ),
                    _buildDetailCard(
                      "Weight",
                      "${weight.toStringAsFixed(1)} kg",
                      weightColor,
                    ),
                    _buildDetailCard("Age", "$age years", ageColor),
                  ],
                ),
                const SizedBox(height: 50),
                // Health Advice Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: statusColor.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Health Advice",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: statusColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        getHealthAdvice(BMI),
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // Back Button
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purpleColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Recalculate",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(String label, String value, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
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
    return "Normal";
  } else if (BMI >= 25 && BMI < 30) {
    return "Overweight";
  } else {
    return "Obese";
  }
}

Color getStatusColor(double BMI) {
  if (BMI < 18.5) {
    return const Color(0xFF3B9FCC); // Blue for underweight
  } else if (BMI >= 18.5 && BMI < 25) {
    return const Color(0xFF2ECB71); // Green for normal
  } else if (BMI >= 25 && BMI < 30) {
    return const Color(0xFFFFA500); // Orange for overweight
  } else {
    return const Color(0xFFE74C3C); // Red for obese
  }
}

String getHealthAdvice(double BMI) {
  if (BMI < 18.5) {
    return "You're underweight. Focus on a balanced diet with more calories and nutrients. Consider consulting a nutritionist.";
  } else if (BMI >= 18.5 && BMI < 25) {
    return "Great! You have a normal weight. Keep maintaining a healthy lifestyle with regular exercise and a balanced diet.";
  } else if (BMI >= 25 && BMI < 30) {
    return "You're overweight. Increase physical activity and adjust your diet to reduce calorie intake gradually.";
  } else {
    return "You're in the obese category. Consult a doctor or nutritionist for a personalized weight management plan.";
  }
}