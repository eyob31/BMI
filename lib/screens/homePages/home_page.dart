import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text('Enter your Details',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal)),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(96, 41, 3, 8)),
                        gapPadding: 10.0,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    isDense: true,
                    label: Text('Weight'),
                    hintText: '65'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(96, 41, 3, 8)),
                        gapPadding: 10.0,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    isDense: true,
                    label: Text('Height'),
                    hintText: '1.75'),
              ),
            ),
            ElevatedButton(
                focusNode: FocusNode(descendantsAreFocusable: false),
                onPressed: () {},
                style: const ButtonStyle(),
                child: const Text('Result')),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    ));
  }
}
