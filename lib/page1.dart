import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 2021-10-30 Flutter 앱 개발 강좌 Example1 코드
class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TextEditingController _leftController = TextEditingController();
  TextEditingController _rightController = TextEditingController();
  bool _isUsed = false;
  int _result = 0;
  final String _title = '계산기 만들기 exp1';

  void _add() {
    setState(() {
      _result =
          int.parse(_leftController.text) + int.parse(_rightController.text);
      if (_isUsed) {
        _leftController.text = _result.toString();
      }
    });
  }

  void _subtract() {
    setState(() {
      _result =
          int.parse(_leftController.text) - int.parse(_rightController.text);
      if (_isUsed) {
        _leftController.text = _result.toString();
      }
    });
  }

  void _multiply() {
    setState(() {
      _result =
          int.parse(_leftController.text) * int.parse(_rightController.text);
      if (_isUsed) {
        _leftController.text = _result.toString();
      }
    });
  }

  void _divide() {
    setState(() {
      _result =
          int.parse(_leftController.text) ~/ int.parse(_rightController.text);
      if (_isUsed) {
        _leftController.text = _result.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.02),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: size.width * 0.45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.green),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    controller: _leftController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '왼쪽 피연산자',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
                Container(
                  width: size.width * 0.45,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.green),
                      borderRadius: BorderRadius.circular(12)),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _rightController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '오른쪽 피연산자',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: _add,
                    child: _operatorButtonWidget('+', size)),
                FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: _subtract,
                    child: _operatorButtonWidget('-', size))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: _multiply,
                    child: _operatorButtonWidget('*', size)),
                FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: _divide,
                    child: _operatorButtonWidget('/', size))
              ],
            ),
            Divider(
              thickness: 2,
            ),
            Container(
              decoration: BoxDecoration(
                  color: _isUsed ? Colors.tealAccent : Colors.grey[400],
                  border: Border.all(width: 0.5, color: Colors.black)),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    _isUsed = !_isUsed;
                  });
                },
                child: Row(
                  children: [
                    Icon(_isUsed ? Icons.check_box : Icons.check_box_outlined),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text('누적 사용하기')
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              '결과 창',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.2,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                '$_result',
                style: TextStyle(fontSize: 23),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _operatorButtonWidget(String operator, Size size) {
    return Container(
      width: size.width * 0.35,
      height: size.width * 0.35,
      margin: EdgeInsets.all(size.width * 0.01),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.black54),
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey[300]),
      child: Text(
        operator,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
