import 'package:material_ui/material_ui.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screens/transactions_screen.dart';

import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        builder: (context, child) {
          return ColoredBox(
            color: const Color(0xFF10232D),
            child: SafeArea(
              bottom: false,
              child: child!,
            ),
          );
        },
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'Roboto',
        ),
        home: const TransactionsScreen(),
      ),
    );
  }
}
