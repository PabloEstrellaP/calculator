import 'package:flutter/material.dart';

class ColorsButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;

  const ColorsButton({Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: MaterialButton(
        onPressed: this.onPressed,
        splashColor: Colors.transparent,
        minWidth: MediaQuery.of(context).size.width * 0.474,
        height: 40,
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: Text(
            this.icon,
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.08, color: Colors.white),  
          ),
        ),
      ),  
    );
  }
}