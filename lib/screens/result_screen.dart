import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.bmiResult,
      required this.interpretation,
      required this.resultText});

  final String bmiResult;
  final String interpretation;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // 'YOUR RESULT' text
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              )),

              // Result showing container
              Expanded(
                  flex: 5,
                  child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(resultText.toUpperCase(),
                                style: kResultTextStyle),
                            Text(bmiResult, style: kBMITextStyle),
                            Text(
                              interpretation,
                              textAlign: TextAlign.center,
                              style: kBodyTextStyle,
                            )
                          ]),
                      onPressed: () {})),
              BottomButton(
                buttonTitle: 'RECALCULATE',
                onClick: () {
                  Navigator.pop(context);
                },
              )
            ]));
  }
}
