import 'package:flutter/material.dart';
import 'package:ios_keyboard_action/ios_keyboard_action.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'IOSKeyboardAction'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nextFieldFocus = FocusNode();
  final previousFieldFocus = FocusNode();
  final doneFieldFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IOSKeyboardAction(
                  focusNode: doneFieldFocus,
                  focusActionType: FocusActionType.done,
                  doneButtonStyle: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  doneButton: const Icon(
                    Icons.keyboard_hide_rounded,
                    color: Colors.black,
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Done',
                    ),
                    focusNode: doneFieldFocus,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nextFieldFocus.dispose();
    doneFieldFocus.dispose();
    previousFieldFocus.dispose();
    super.dispose();
  }
}
