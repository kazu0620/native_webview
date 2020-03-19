import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:native_webview_example/screens/initial_data_screen.dart';
import 'package:native_webview_example/screens/initial_data_with_base_url_screen.dart';
import 'package:native_webview_example/screens/initial_url_screen.dart';
import 'package:native_webview_example/screens/on_js_prompt_screen.dart';
import 'package:native_webview_example/screens/open_dropdown_screen.dart';

void main() {
  // Enable integration testing with the Flutter Driver extension.
  // See https://flutter.dev/testing/ for more info.
  enableFlutterDriverExtension();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final items = [
    InitialUrlScreen(),
    InitialDataScreen(),
    InitialDataWithBaseUrlScreen(),
    OnJsPromptScreen(),
    OpenDropdownScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('native_webview example app'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: Text(item.toString()),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => item,
                  ),
                );
              },
            );
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}