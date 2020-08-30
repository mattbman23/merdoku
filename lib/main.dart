import 'dart:math';

import 'package:flutter/material.dart';
import 'package:merdoku/constant/constants.dart';
import 'package:merdoku/screen/board.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Merdoku',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;
    Random random = new Random();

    return SafeArea(
      child: Scaffold(
        backgroundColor: colors[random.nextInt(colors.length)],
        body: Stack(
          children: [
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                color: Color.fromRGBO(236, 236, 236, 1),
                height: appSize.height * 0.178,
                width: appSize.width,
              ),
            ),
            Positioned(
              bottom: (appSize.height * 0.178) - 62,
              width: appSize.width,
              child: Center(
                child: Container(
                  height: 124,
                  width: 124,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      size: 75,
                      color: Color.fromRGBO(60, 60, 60, 1),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Board(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
