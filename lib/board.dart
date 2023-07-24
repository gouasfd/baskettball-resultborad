import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resultboard/bloc/conter_increament.dart';
import 'package:resultboard/bloc/cubit_conter.dart';

class Resultboard extends StatefulWidget {
  const Resultboard({Key? key});

  @override
  State<Resultboard> createState() => _ResultboardState();
}

class _ResultboardState extends State<Resultboard> {
  late Timer _timer;
  int _secondsRemaining = 600; // 10 minutes
  int homep = 0;
  int awayp = 0;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;
    final _width = MediaQuery.of(context).size.width;
    final _heigt = MediaQuery.of(context).size.height;

    return BlocConsumer<Cubitconter,Counter>(
      listener: (context, state) {
        if(state is IncreamentA){
          
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        )),
                    child: Text(
                      "$minutes:${seconds.toString().padLeft(2, '0')}",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      startTimer();
                    },
                    child: Text("Begin match"),
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Teamresult(homep, awayp, _width as double, _heigt as double),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ignore: non_constant_identifier_names
Widget Teamresult(int home, int away, double width, double height) {
  final ismobaile = width <= 600;
  return SizedBox(
    width: width,
    height: ismobaile ? height / 1.6 : height / 2.7,
    child: ismobaile
        ? ListView(
            scrollDirection: Axis.vertical,
            children: [
              MutableSide(
                hh: "HOME",
                point: home,
                width: width,
                height: height,
                image: "assets/lakers.png",
              ),
              Divider(
                height: 30,
                thickness: 2,
                color: Colors.grey,
              ),
              MutableSide(
                hh: "AWAY",
                point: away,
                width: width,
                height: height,
                image: "assets/wor.png",
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MutableSide(
                hh: "HOME",
                point: home,
                width: width,
                height: height,
                image: "assets/lakers.png",
              ),
              SizedBox(
                width: 20,
              ),
              // Divider(
              //   height: 40,
              //   thickness: 2,
              //   color: Colors.grey,
              // ),
              MutableSide(
                hh: "AWAY",
                point: away,
                width: width,
                height: height,
                image: "assets/wor.png",
              ),
            ],
          ),
  );
}

class MutableSide extends StatefulWidget {
  final String hh;
  final int point;
  final double width;
  final double height;
  final String image;

  const MutableSide({
    Key? key,
    required this.hh,
    required this.point,
    required this.width,
    required this.height,
    required this.image,
  }) : super(key: key);

  @override
  State<MutableSide> createState() => _MutableSideState();
}

class _MutableSideState extends State<MutableSide> {
  late int point;

  @override
  void initState() {
    super.initState();
    point = widget.point;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: widget.width,
      child: Column(
        children: [
          Image(
            image: AssetImage(widget.image),
            width: 80,
            height: 80,
          ),
          Text(
            "${widget.hh}",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          Text(
            "$point",
            style: TextStyle(fontSize: 35),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    point++;
                  });
                },
                child: Text("add1"),
              ),
              SizedBox(
                width: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    point = point + 2;
                  });
                },
                child: Text("add2"),
              ),
              SizedBox(
                width: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    point = point + 3;
                  });
                },
                child: Text("add3"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    point = 0;
                  });
                },
                child: Text("reset"),
              ),
            ],
          ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.purple,
          //   ),
          //   onPressed: () {
          //     setState(() {
          //       point = 0;
          //     });
          //   },
          //   child: Text("reset"),
          // ),
        ],
      ),
    );
  }
}
