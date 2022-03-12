import 'package:flutter/material.dart';

import '../../Theme/app_color.dart';
import '../auth/auth_model.dart';
import '../auth/auth_widget.dart';
import '../main_screen/main_screen_widget.dart';
import '../movie_details/movie_details_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainDarkBlue,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        '/auth': (context) => AuthProvider(
              model: AuthModel(),
              child: const AuthWdget(),
            ),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/movie_details_widget': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailsWidget(movieId: arguments);
          } else {
            return const MovieDetailsWidget(movieId: 0);
          }
        }
      },
      initialRoute: '/auth',
    );
  }
}
