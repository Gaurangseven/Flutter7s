import 'package:flutter/material.dart';
import 'package:flutter7s/constants.dart';
import 'package:flutter7s/listScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1A40),
      appBar: AppBar(
        backgroundColor: const Color(0xff151D3B),
        title: const Center(
            child: Text(
          "Flutter7's",
          style: khead,
        )),
      ),
      body: Column(
        children: [
          FadeTransition(
            opacity: _animation,
            child: Center(
                child: Image.asset(
              'assets/flutter.png',
              height: 200,
              width: 200,
            )),
          ),
          Center(
            child: Image.asset('assets/hfest.png', height: 300, width: 200),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 80.0, right: 80.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListScreen()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  height: 50,
                  width: 400,
                  child: const Center(
                      child: Text(
                    "Meet Devs",
                    style: kbuttonhead,
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
