import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '가위바위보 게임',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('가위바위보 게임 ')),
        body: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final path = 'images/';
  final types = ['rock', 'scissors', 'paper'];
  bool isFirst = true;
  String userInput = 'rock';
  String cpuInput = '?';
  String result = '무승부';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isFirst
            ? Expanded(
                child: Center(
                child: Container(
                    width: 150,
                    height: 150,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(width: 8, color: Colors.grey),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                        child: Text('?',
                            style:
                                TextStyle(fontSize: 60, color: Colors.blue)))),
              ))
            : Expanded(child: Center(child: makeContainer2(cpuInput))),
        Expanded(
            child: Center(
                child: Text(result,
                    style: const TextStyle(fontSize: 40, color: Colors.red)))),
        Expanded(
          child: Row(
            children: [
              Expanded(child: makeInkWell('rock')),
              Expanded(child: makeInkWell('scissors')),
              Expanded(child: makeInkWell('paper')),
            ],
          ),
        ),
      ],
    );
  }

  Container makeContainer(String type) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(width: 8, color: Colors.grey),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Image.asset('$path$type.png'));
  }

  Container makeContainer2(String type) {
    return Container(
        height: 150,
        width: 150,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(width: 8, color: Colors.grey),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Image.asset('$path$type.png'));
  }

  InkWell makeInkWell(String type) {
    return InkWell(onTap: () => setUserInput(type), child: makeContainer(type));
  }

  void setUserInput(String type) {
    setState(() {
      userInput = type;
      cpuInput = types[Random().nextInt(3)];
      isFirst = false;
      result = getResult();
    });
  }

  String getResult() {
    if (userInput == 'rock') {
      if (cpuInput == 'rock') {
        return '무승부';
      } else if (cpuInput == 'scissors') {
        return '유저 승';
      } else if (cpuInput == 'paper') {
        return '컴퓨터 승';
      }
    } else if (userInput == 'scissors') {
      if (cpuInput == 'rock') {
        return '컴퓨터 승';
      } else if (cpuInput == 'scissors') {
        return '무승부';
      } else if (cpuInput == 'paper') {
        return '유저 승';
      }
    } else {
      if (cpuInput == 'rock') {
        return '유저 승';
      } else if (cpuInput == 'scissors') {
        return '컴퓨터 승';
      } else if (cpuInput == 'paper') {
        return '무승부';
      }
    }
    return '무승부';
  }
}
