import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "BMI",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: wtController,
                decoration: const InputDecoration(
                  label: Text("Enter your weight (kg)"),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 11),
              TextField(
                controller: ftController,
                decoration: const InputDecoration(
                  label: Text("Enter your height (feet)"),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 11),
              TextField(
                controller: inController,
                decoration: const InputDecoration(
                  label: Text("Enter your height (inches)"),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  var wt = wtController.text.trim();
                  var ft = ftController.text.trim();
                  var inch = inController.text.trim();
                  if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {
                    var iWt = double.parse(wt);
                    var iFt = double.parse(ft);
                    var iInch = double.parse(inch);
                    var tInch = iFt * 12 + iInch;
                    var tCm = tInch * 2.54;
                    var tM = tCm / 100;
                    var bmi = iWt / (tM * tM);
                    var msg = "";
                    if (bmi > 25) {
                      msg = "You are overweight";
                      bgColor = Colors.orange.shade200;
                    } else if (bmi < 18) {
                      msg = "You are underweight";
                      bgColor = Colors.red.shade200;
                    } else {
                      msg = "You are healthy";
                      bgColor = Colors.green.shade200;
                    }
                    setState(() {
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                    });
                  } else {
                    setState(() {
                      result = "Please enter all the details";
                    });
                  }
                },
                child: const Text("Calculate"),
              ),
              const SizedBox(height: 12),
              Text(
                result,
                style: const TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
