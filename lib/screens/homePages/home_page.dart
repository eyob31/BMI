import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Text('Enter your Details',
              style: TextStyle(
                  color: Color.fromARGB(96, 41, 3, 8),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              controller: weightController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
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
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              controller: heightController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
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
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    barrierColor: Colors.transparent,
                    context: context,
                    builder: (_) {
                      return Container(
                        color: Colors.black54,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Your BMI is',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 206, 218, 228),
                                      fontSize: 20)),
                            ]),
                      );
                    });

                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return AlertDialog(
                //         content: Text(weightController.text),
                //         actions: [Text(heightController.text)],
                //       );
                //     });
              },
              style: const ButtonStyle(),
              child: const Text('Result')),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    ));
  }
}
