import 'package:bund/core/config/theme/bloc/theme_bloc.dart';
import 'package:bund/features/main_screen/presentation/blocs/main_screen/main_screen_bloc.dart';
import 'package:bund/features/main_screen/presentation/screens/main_screen.dart';
import 'package:bund/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Future future;
  @override
  void initState() {
    super.initState();
    future = Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()..add(InitApp()), lazy: false),
        BlocProvider<MainScreenBloc>(
            create: (context) => MainScreenBloc()..add(MainScreenEvent()), lazy: false),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            locale: Locale(state.appLanguage.lang),
            theme: ThemeData(
              scaffoldBackgroundColor: state.themeData.scaffoldColor,
            ),
            home: FutureBuilder(
              future: future,
              builder: (context, state) {
                if (state.connectionState == ConnectionState.waiting) return Container();
                return const MainScreen();
              },
            ),
          );
        },
      ),
    );
  }
}
