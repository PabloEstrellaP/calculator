import 'package:calculator/widgets/colorsButton.dart';
import 'package:flutter/material.dart';

import 'package:calculator/widgets/customInput.dart';

class MathController extends StatefulWidget {
  MathController({Key? key}) : super(key: key);

  @override
  _MathControllerState createState() => _MathControllerState();
}

class _MathControllerState extends State<MathController> {
  final numCtrl = TextEditingController();
  final num2Ctrl = TextEditingController();
  String result = '0';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only( top: 50 ),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text('Resultado: $result', style: TextStyle( 
              fontSize: 0.09 * MediaQuery.of(context).size.width),),
          ),
        ),
        CustomInput(
          icon: Icons.format_list_numbered, 
          placeholder: 'Número 1', 
          textController: numCtrl,
          keyBoardType: TextInputType.number,
        ),
        CustomInput(
          icon: Icons.format_list_numbered, 
          placeholder: 'Número 2', 
          textController: num2Ctrl,
          keyBoardType: TextInputType.number,
        ),
        Row(
          children: [
            ColorsButton(
              icon: '+',
              onPressed: (){
                _check( '+' );
              },
            ),
            ColorsButton(
              icon: '-',
              onPressed: (){
                _check( '-' );
              }
            ),
          ],
        ),
        Row(
          children: [
            ColorsButton(
              icon: '*',
              onPressed: (){
                _check( '*' );
              }
            ),
            ColorsButton(
              icon: '/',
              onPressed: (){
                _check( '/' );
              }
            ),
          ],
        ),
        ColorsButton(
          icon: 'AC',
          onPressed: (){
            _check( 'AC' );
          }
        ),
      ],
    );
  }
  void _check( String operation ){
    if( numCtrl.text.length == 0 || num2Ctrl.text.length == 0){
      print( 'No se hizo nada ' );
    }else{
      switch(operation){
        case '+':
          _sum();
        break;
        case '-':
          _res();
        break;
        case '*':
          _times();
        break;
        case '/':
          _divide();
        break;
        default:
          _restart();
        break;
      }
      setState(() {
        if( result.contains('.0') ){
          result = result.substring(0, result.length - 2);
        }
      });
    }
  }

  void _sum(){
    setState(() => result = (double.parse(numCtrl.text) + double.parse(num2Ctrl.text)).toString()); 
  }

  void _res(){
    setState(() => result = (double.parse(numCtrl.text) - double.parse(num2Ctrl.text)).toString()); 
  }

  void _times(){
    setState(() => result = (double.parse(numCtrl.text) * double.parse(num2Ctrl.text)).toString()); 
  }

  void _divide(){
    setState(() => result = (double.parse(numCtrl.text) / double.parse(num2Ctrl.text)).toString()); 
  }
  
  void _restart(){
    setState(() {
      result = '0';
      numCtrl.text = '';
      num2Ctrl.text = '';
    });
  }
}