import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import '../utils/calculate_bmi.dart';

enum Gender {
  male,
  female,
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          //  Male and Female Container Buttons
          Expanded(
              child: Row(
            children: [
              // For the Male Container Button
              Expanded(
                child: ReusableCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars, label: 'Male'),
                ),
              ),
              // For the Female Container Button
              Expanded(
                child: ReusableCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars, label: 'Female'),
                ),
              ),
            ],
          )),

          // The Slider for the Height
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                children: [
                  const Text('Height', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  // Slider
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTickMarkColor: const Color(0xFF8D8E98),
                        activeTickMarkColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          height = newValue.round();
                        },
                      ))
                ],
              ),
              onPressed: () {},
            ),
          ),

          // Weight and Age Container Buttons
          Expanded(
              child: Row(children: [
            //  the Weight container button
            Expanded(
                child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Weight', style: kLabelTextStyle),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      // Minus Button
                      RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          }),
                      const SizedBox(width: 10.0),
                      // Plus button
                      RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          }),
                    ]),
                  ]),
              onPressed: () {},
            )),

            //   Age Container Button

            Expanded(
                child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Age', style: kLabelTextStyle),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      // Minus Button
                      RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          }),
                      const SizedBox(width: 10.0),
                      // Plus button
                      RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          }),
                    ]),
                  ]),
              onPressed: () {},
            ))
          ])),
          // The Calculate Button
          BottomButton(
            buttonTitle: 'CALCULATE',
            onClick: () {
              BmiLogic calc = BmiLogic(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ));
            },
          )
        ],
      ),
    );
  }
}
