import 'package:flutter/material.dart';
import 'package:awesome_ui/awesome_ui.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AwesomeUIExampleApp());
}

class AwesomeUIExampleApp extends StatefulWidget {
  const AwesomeUIExampleApp({super.key});

  @override
  State<AwesomeUIExampleApp> createState() => _AwesomeUIExampleAppState();
}

class _AwesomeUIExampleAppState extends State<AwesomeUIExampleApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuiTheme(
      data: _isDarkMode ? AuiThemeData.dark() : AuiThemeData.light(),
      child: MaterialApp(
        title: 'Awesome UI Example',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark),
        ),
        themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: HomeScreen(onToggleTheme: _toggleTheme, isDarkMode: _isDarkMode),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
