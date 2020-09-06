import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:merdoku/screen/board.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Merdoku',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xffd8d6d8),
        lightSource: LightSource.topLeft,
        depth: 10,
        appBarTheme: NeumorphicAppBarThemeData(
          buttonStyle: NeumorphicStyle(
            color: Colors.black54,
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(12),
            ),
          ),
          textStyle: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedDiff = "Easy";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: NeumorphicAppBar(
            title: Text(
              "Merdoku",
              style: TextStyle(
                color: _textColor(context),
              ),
            ),
            actions: [
              NeumorphicButton(
                child: Icon(
                  Icons.info_outline,
                  color: _iconColor(context),
                ),
                onPressed: () {},
              ),
              NeumorphicButton(
                child: Icon(
                  Icons.wb_sunny,
                  color: _iconColor(context),
                ),
                onPressed: () {
                  NeumorphicTheme.of(context).themeMode =
                      NeumorphicTheme.isUsingDark(context)
                          ? ThemeMode.light
                          : ThemeMode.dark;
                },
              )
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              difficultyBtn(context, "Easy"),
              SizedBox(
                height: 23,
              ),
              difficultyBtn(context, "Medium"),
              SizedBox(
                height: 23,
              ),
              difficultyBtn(context, "Hard"),
              SizedBox(
                height: 35,
              ),
              NeumorphicButton(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                ),
                child: Icon(
                  Icons.play_arrow,
                  size: 60,
                  color: _textColor(context),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BoardScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget difficultyBtn(BuildContext context, String btnTitle) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        color: selectedDiff == btnTitle ? Colors.grey : null,
      ),
      onPressed: () {
        setState(() {
          selectedDiff = btnTitle;
        });
      },
      child: SizedBox(
        child: Center(
          child: Text(
            btnTitle,
            style: TextStyle(
              color: _textColor(context),
              fontSize: 23,
            ),
          ),
        ),
        width: 100,
      ),
    );
  }

  Color _textColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.white;
    } else {
      return Colors.black54;
    }
  }

  Color _iconColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.white;
    } else {
      return Colors.white70;
    }
  }
}
