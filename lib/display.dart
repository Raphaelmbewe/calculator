import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/services.dart';

class DisplayForCalculator extends StatefulWidget {
  @override
  _DisplayForCalculatorState createState() => _DisplayForCalculatorState();
}

class _DisplayForCalculatorState extends State<DisplayForCalculator> {
  String outPut = '0';
  double input1 = 0;
  double input2 = 0;
  String operand = '';

  @override
  void initState() {
    super.initState();
    outPut = '0';
  }

  buttonPressed(String buttonClick) {
    if (buttonClick == 'clear') {
      input1 = 0.0;
      input2 = 0.0;
      operand = '';
      outPut = '0';
    } else if (buttonClick == '+' ||
        buttonClick == '-' ||
        buttonClick == '÷' ||
        buttonClick == 'x') {
      input1 = double.parse(outPut);
      operand = buttonClick;
      outPut = '0';
    } else if (buttonClick == 'c') {
      //more deleting a digit at c
      operand = '';
      outPut = outPut.substring(0, outPut.length - 1);
    } else if (buttonClick == '.') {
      if (outPut.contains('.')) {
        return;
      } else {
        outPut = outPut + buttonClick;
      }
    } else if (buttonClick == '=') {
      input2 = double.parse(outPut);
      if (operand == '+') {
        outPut = (input1 + input2).toStringAsFixed(0);
      } else if (operand == '-') {
        outPut = (input1 - input2).toStringAsFixed(0);
      } else if (operand == 'x') {
        outPut = (input1 * input2).toStringAsFixed(0);
      } else if (operand == '÷') {
        outPut = (input1 / input2).toStringAsFixed(2);
      }
      input1 = 0.0;
      input2 = 0.0;
      operand = '';
    } else if (outPut.length >=10) {
        print('only 10 digits');
    } else {
      if (outPut == '0' || outPut == '0.0') {
        outPut = buttonClick;
      } else {
        outPut = outPut + buttonClick;
      }
    }
    print(outPut);
    setState(() {
      outPut = outPut;
    });
  }

  Widget buildButton(BuildContext context, String buttonText, bool num1) {
    return Container(
      color: Color.fromRGBO(31, 26, 36, 1),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                shape: CircleBorder(),
                child: ClayContainer(
                    spread:1.0,
                    color: Color.fromRGBO(31, 26, 36, 1),
                    surfaceColor: num1 == true
                        ? Colors.orange[900]
                        : Color.fromRGBO(31, 26, 36, 1),
                    height: 55,
                    width: 55,
                    borderRadius: 50,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ClayText(
                        buttonText,
                        emboss: true,
                        size: 15.0,
                        textColor: Colors.white,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                onPressed: () {
                  buttonPressed(buttonText);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Color.fromRGBO(31, 26, 36, 1),
          elevation: 0.0,
          title: Text(
            "Calculator",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromRGBO(31, 26, 36, 0.08),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(31, 26, 36, 1),
            child: Column(
              children: <Widget>[
                Container(
                  color: Color.fromRGBO(31, 26, 36, 0.08),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 24.0,
                  ),
                  child: Expanded(
                    child: ClayContainer(
                      width: MediaQuery.of(context).size.width,
                      spread: 0,
                      depth: 40,
                      emboss: true,
                      borderRadius: 10.0,
                      child: ClayText(
                        //screen output
                        '$outPut',
                        textColor: Colors.black,
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton(context, '7', false),
                    buildButton(context, '8', false),
                    buildButton(context, '9', false),
                    buildButton(context, '-', true),
                    /* OutlineButton(
                      shape: CircleBorder(),
                      child: ClayContainer(
                          color: Colors.blue[300],
                          height: 70,
                          width: 70,
                          borderRadius: 50,
                          surfaceColor: Colors.orange[900],
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: ClayText(
                              '-',
                              emboss: true,
                              size: 30.0,
                              textColor: Colors.black,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      onPressed: () {
                        
                        return buttonPressed('');
                      },
                    ),*/
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton(context, '4', false),
                    buildButton(context, '5', false),
                    buildButton(context, '6', false),
                    buildButton(context, '+', true),
                    /*OutlineButton(
                      shape: CircleBorder(),
                      child: ClayContainer(
                          color: Colors.blue[300],
                          height: 70,
                          width: 70,
                          borderRadius: 50,
                          surfaceColor: Colors.orange[900],
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: ClayText(
                              '+',
                              emboss: true,
                              size: 30.0,
                              textColor: Colors.black,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      onPressed: () {},
                    ),*/
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton(context, '1', false),
                    buildButton(context, '2', false),
                    buildButton(context, '3', false),
                    buildButton(context, '÷', true),
                    /*OutlineButton(
                      shape: CircleBorder(),
                      child: ClayContainer(
                          color: Colors.blue[300],
                          height: 70,
                          width: 70,
                          borderRadius: 50,
                          surfaceColor: Colors.orange[900],
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: ClayText(
                              '÷',
                              emboss: true,
                              size: 30.0,
                              textColor: Colors.black,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      onPressed: () {},
                    ),*/
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton(context, '0', false),
                    buildButton(context, '.', false),
                    buildButton(context, 'c', false),
                    buildButton(context, 'x', true),
                    /* OutlineButton(
                      shape: CircleBorder(),
                      child: ClayContainer(
                          color: Colors.blue[300],
                          height: 70,
                          width: 70,
                          borderRadius: 50,
                          surfaceColor: Colors.orange[900],
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: ClayText(
                              'x',
                              emboss: true,
                              size: 30.0,
                              textColor: Colors.black,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      onPressed: () {},
                    ),*/
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton(context, '=', true),
                    /*MaterialButton(
                      shape: CircleBorder(),
                      child: ClayContainer(
                          color: Colors.blue[300],
                          height: 70,
                          width: 150,
                          borderRadius: 50,
                          surfaceColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                              right: 80.0,
                              left: 60.0,
                            ),
                            child: ClayText(
                              '=',
                              size: 40.0,
                              textColor: Colors.black,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      onPressed: () {
                        return '=';
                      },
                    ),*/
                    /* MaterialButton(
                      shape: CircleBorder(),
                      child: ClayContainer(
                          color: Colors.blue[300],
                          height: 70,
                          width: 150,
                          borderRadius: 50,
                          surfaceColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                              left: 40.0,
                            ),
                            child: ClayText(
                              'clear',
                              size: 30.0,
                              textColor: Colors.black,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      onPressed: () {},
                    ),*/
                    buildButton(context, 'clear', true),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
