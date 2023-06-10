import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late Animation animation;

  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    animation = Tween(begin: 200.0, end: 100.0).animate(animationController);

    animation.addListener(() {
      print(animation.value);
      setState(() {});
    });
    animationController.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TweenAnimation'),
      ),
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          color: Colors.lightGreenAccent,
        ),
      ),
    );
  }
}
