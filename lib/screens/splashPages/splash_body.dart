import 'package:flutter/material.dart';

class BmiSplashBody extends StatelessWidget {
  const BmiSplashBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Center(
            child: Column(
              children: const [
                Spacer(),
                Text('BMI Calculator',
                    style: TextStyle(
                        color: Color.fromARGB(96, 41, 3, 8),
                        fontStyle: FontStyle.italic,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15,
                ),
                CircularProgressIndicator(color: Color.fromARGB(96, 41, 3, 8)),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
