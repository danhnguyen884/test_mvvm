import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_mvvm/src/ui/screens/home_screen.dart';
import 'package:test_mvvm/src/ui/screens/media_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  ).then((_) => runApp(MyApp()));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MediaViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Media Player',
        theme: ThemeData(
          appBarTheme: AppBarTheme(),
          primaryColor: Colors.purple,
          accentColor: Colors.deepOrange
        ),
        initialRoute: '/',
        routes: {
            '/' : (context) => HomeScreen(),
        } 
      ),
    );
}
}