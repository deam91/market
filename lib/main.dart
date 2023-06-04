import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market/core/router/router.dart';
import 'package:market/core/theme/texts.dart';
import 'package:market/features/home/repository/home_repository_impl.dart';
import 'package:market/features/product/repository/product_repository_impl.dart';
import 'package:market/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final container = ProviderContainer();
  container.read(productRepositoryProvider);
  container.read(homeRepositoryProvider);
  runApp(UncontrolledProviderScope(container: container, child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: interBlack,
          bodyMedium: interBlack,
          bodySmall: interBlack,
        ),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
