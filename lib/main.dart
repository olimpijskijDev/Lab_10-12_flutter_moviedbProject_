import 'package:flutter/material.dart';
import 'package:kinoapp/widget/auth/auth_widget.dart';
import 'package:kinoapp/widget/main_screen/main_screen_widget.dart';
import 'package:kinoapp/theme/app_colors.dart';
import 'package:kinoapp/widget/movie_details/movie_details_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.mainDarkBlue),
        primarySwatch: Colors.blue,
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //     backgroundColor: AppColors.mainDarkBlue,
        //     selectedIconTheme: IconThemeData(color: Colors.white),
        //     unselectedIconTheme: IconThemeData(color: Colors.white)),
      ),
      routes: {
        'first_screen': (context) => AuthWidget(),
        '/second_screen': (context) => MainScreenWidget(),
        '/second_screen/movie_details': (context) {
          final id = ModalRoute.of(context)!.settings.arguments as int;
          return MovieDetailsWidget(movieId: id);
        }
      },
      initialRoute: 'first_screen',
      home: AuthWidget(),
    );
  }
}
