import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pomodorosMinutesTemplate = [1, 15, 20, 25, 30, 35];
  int defaultPomodoroMinutes = 25;
  int currentSelectedMinutes = 25;
  int restTimeSeconds = 5;
  late int totalSeconds;
  bool isRunning = false;
  bool isRest = false;
  int totalPomodoros = 0;
  int totalGoal = 0;
  int cycle = 2;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    totalSeconds = defaultPomodoroMinutes * 60;
  }

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      // 타이머가 끝났을 때 변수 초기화
      if (isRest) {
        // 휴식 끝
        setState(() {
          totalPomodoros = totalPomodoros + 1;
          if (totalPomodoros >= cycle) {
            totalGoal = totalGoal + 1;
            totalPomodoros = 0;
          } else {}
          if (currentSelectedMinutes == 1) {
            totalSeconds = 5;
          } else {
            totalSeconds = currentSelectedMinutes * 60;
          }
          isRest = false;
          isRunning = false;
        });
        timer.cancel();
      } else {
        // 휴식 타이머 시작
        setState(() {
          totalSeconds = restTimeSeconds;
          isRest = true;
        });
      }
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onRestart() {
    timer.cancel();
    setState(() {
      totalSeconds = currentSelectedMinutes * 60;
      isRunning = false;
      isRest = false;
      totalPomodoros = 0;
    });
  }

  void selectTime(int minutes) {
    setState(() {
      if (minutes == 1) {
        totalSeconds = 5;
      } else {
        totalSeconds = minutes * 60;
      }
      currentSelectedMinutes = minutes;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isRest
          ? Colors.green[300]
          : Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "POMOTIMER",
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  format(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var minute in pomodorosMinutesTemplate)
                      TextButton(
                        child: Text(
                          "$minute",
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 20,
                            fontWeight: currentSelectedMinutes == minute
                                ? FontWeight.bold
                                : FontWeight.w200,
                          ),
                        ),
                        onPressed: () => selectTime(minute),
                      )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 120,
                      color: Theme.of(context).cardColor,
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      icon: Icon(isRunning
                          ? Icons.pause_circle_outline_rounded
                          : Icons.play_circle_outline_rounded),
                    ),
                    isRunning
                        ? IconButton(
                            iconSize: 120,
                            color: Theme.of(context).cardColor,
                            onPressed: onRestart,
                            icon: const Icon(Icons.restart_alt_rounded),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ROUNDS",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .color,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "$totalPomodoros",
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "/$cycle",
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "GOAL",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .color,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "$totalGoal",
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "/12",
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
