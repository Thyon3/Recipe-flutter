import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'app_config.dart';
import 'constants.dart';
import 'utils.dart';
import 'themes/app_theme.dart';
import 'widgets/custom_scaffold.dart';
import 'widgets/counter_display.dart';
import 'widgets/increment_button.dart';
import 'widgets/reset_button.dart';
import 'widgets/theme_toggle.dart';
import 'pages/home_screen.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
  
  if (kIsWeb) {
    debugPrint('Running on web platform');
  } else {
    debugPrint('Running on mobile platform');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Flutter Recipe Home'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  static const String _counterLabel = 'You have pushed the button this many times:';

  void _incrementCounter() {
    setState(() {
      _counter++;
      debugPrint('Counter incremented to: $_counter');
    });
  }
  
  void _resetCounter() {
    setState(() {
      _counter = 0;
      debugPrint('Counter reset to: $_counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return CustomScaffold(
      title: widget.title,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CounterDisplay(count: _counter),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IncrementButton(
                  onPressed: _incrementCounter,
                  isLoading: false,
                ),
                ResetButton(
                  onPressed: _resetCounter,
                  isLoading: false,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppUtils.showSnackBar(context, 'Theme: ${isDark ? "Dark" : "Light"}');
        },
        tooltip: 'Show Theme Info',
        child: ThemeToggle(
          isDark: isDark,
          onPressed: () {},
        ),
      ),
    );
  }
}
