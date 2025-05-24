import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'pages/main_reglog.dart';
import 'providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await Hive.initFlutter();
  // final box = await Hive.openBox('users');

  // print("=== Users in Hive ===");
  // box.toMap().forEach((key, value) {
  //   print("Email: $key | Password: $value");
  // });

  runApp(const ProviderScope(child: MyRoyalApp()));
}

class MyRoyalApp extends ConsumerWidget {
  const MyRoyalApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return MaterialApp(
      title: 'FOS',
      theme: theme,
      home: const MainRegLog(),
    );
  }
}
