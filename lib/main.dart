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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '👊';

  String computerHand = '👊';

  String jankenResult = '引き分け';

//帰り値の型 関数名 (引数の型 引数名) {関数の処理}のルールで記述する
  void selectHand(String selectedHand) {
    myHand = selectedHand;
    print(myHand);
    generateComputerHand();
    judge();
    setState(() {});
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3); //0, 1, 2の数値がランダムに生成される処理

    //rondomNumberToHand関数の引数にRandom関数で0~2のランダムな値を代入する
    computerHand = randomNumberToHand(randomNumber);
  }

//ランダムな整数をじゃんけんの絵文字に変換する為の関数
  String randomNumberToHand(int randomNumber) {
    //switch文で引数に渡された値に応じた処理を実行させる
    switch (randomNumber) {
      case 0:
        return '👊';
      case 1:
        return '✌️';
      case 2:
        return '✋';
      default:
        return '';
    }
  }

  void judge() {
    if (myHand == computerHand) {
      jankenResult = '引き分け';
    } else if (myHand == '👊' && computerHand == '✌️') {
      jankenResult = '勝ち！';
    } else if (myHand == '✌️' && computerHand == '✋') {
      jankenResult = '勝ち！';
    } else if (myHand == '✋' && computerHand == '👊') {
      jankenResult = '勝ち！';
    } else {
      jankenResult = '負け・・・';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              jankenResult,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Text(
              computerHand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 48),
            Text(
              myHand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand('👊');
                  },
                  child: Text('👊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✌️');
                  },
                  child: Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✋');
                  },
                  child: Text('✋'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
