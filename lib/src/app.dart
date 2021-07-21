import 'package:flutter/material.dart';
import 'package:my_diabetes/src/ui/splashScreen.dart';

import 'blocs/login_bloc_provider.dart';
import 'blocs/register_bloc_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LoginBlocProvider(
        child: RegisterBlocProvider(
        child: MaterialApp(
          theme: ThemeData(
            accentColor: Colors.black,
            primaryColor: Colors.amber,
          ),
          home:
            SplashScreen()
        ),
      )
    );
   // );
  }
}
