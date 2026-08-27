import 'package:flutter/material.dart';
import 'pages/main_page.dart';

// Brand colors from editorial-web @theme tokens
const Color kOrange = Color(0xFFFE7141);
const Color kBlack = Color(0xFF000000);
const Color kWhite = Color(0xFFFFFFFF);
const Color kDarkBg = Color(0xFF0A0A0A);
const Color kDarkCard = Color(0xFF1A1A1A);

void main() => runApp(const EditorialApp());

// ---------- Theme data ----------
class AppTheme {
  static final light = ThemeData(
    scaffoldBackgroundColor: kWhite,
    colorScheme: ColorScheme.fromSeed(seedColor: kOrange, brightness: Brightness.light),
  );
  static final dark = ThemeData(
    scaffoldBackgroundColor: kDarkBg,
    colorScheme: ColorScheme.fromSeed(seedColor: kOrange, brightness: Brightness.dark),
  );
}

// ---------- Theme context ----------
class ThemeState extends InheritedWidget {
  final bool isDark;
  final VoidCallback toggle;

  const ThemeState({super.key, required this.isDark, required this.toggle, required super.child});

  static ThemeState of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<ThemeState>()!;

  @override
  bool updateShouldNotify(ThemeState old) => isDark != old.isDark;
}

class EditorialApp extends StatefulWidget {
  const EditorialApp({super.key});
  @override
  State<EditorialApp> createState() => _EditorialAppState();
}

class _EditorialAppState extends State<EditorialApp> {
  bool _isDark = false;
  void _toggle() => setState(() => _isDark = !_isDark);

  @override
  Widget build(BuildContext context) {
    return ThemeState(
      isDark: _isDark,
      toggle: _toggle,
      child: MaterialApp(
        title: 'State of AI Design',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
        home: const MainPage(),
      ),
    );
  }
}
