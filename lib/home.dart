import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget btn( var txt){
    return
      Container(
        margin: EdgeInsets.only(bottom: 2),
          child:
          ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 100, height: 128),
    child: ElevatedButton(onPressed: (){
        setState(() {
          result = result + txt;
        });
      }, child: Text(txt),
        style: ElevatedButton.styleFrom(
            primary: Color(0xFF4d4847),
            textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold)

        ),

    ),
          ),

      );
  }


  clr(){
    setState(() {
      result = "";
    });
  }

  output(){
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(

              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height*0.33,
              width: MediaQuery.of(context).size.width*0.99,
              color: Colors.black,
              child: Text
                (result, textAlign: TextAlign.right, style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.grey.shade400
              ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("7"),
                btn("8"),
                btn("9"),
                Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child:
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 100, height: 128),
                    child: ElevatedButton(onPressed: clr , child: Text("C"),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF4d4847),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)

                      ),
                    ),
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("4"),
                btn("5"),
                btn("6"),
                btn("-"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("1"),
                btn("2"),
                btn("3"),
                btn("+"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("/"),
                btn("0"),
                btn("*"),
                Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child:
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 100, height: 128),
                    child: ElevatedButton(onPressed: output , child: Text("="),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFFff1900),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold)

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}

