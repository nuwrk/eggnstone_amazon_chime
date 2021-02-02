
import 'package:chime_example/Ui/CreatMeetingScreen.dart';
import 'package:flutter/material.dart';


void main()
{
    runApp(MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
            '/': (context) => CreatMeetingScreen(),
        },
    ));
}