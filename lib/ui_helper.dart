import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class UiHelper {
  customButton(VoidCallback ontap, String text) {
    return SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ), backgroundColor: Colors.deepPurple
          )

          ,
          onPressed: ontap,
          child: Text(
            text, style: const TextStyle(fontSize: 20, color: Colors.white),),)

    );
  }


  Padding customText(TextEditingController controller, String text,
      IconData icon, Color color, bool obscure,TextInputType? keyBoardType ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextField(
        keyboardType: keyBoardType,
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(icon),
            iconColor: color,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            )
        ),


      ),
    );
  }
  customDialogBox(BuildContext context, String text){
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Emty Field'),
        content: Text(text),
        actions: [
          TextButton(onPressed: (
              ){
            Navigator.of(context).pop();

          }, child: Text('cencel')),
          TextButton(onPressed: (
              ){
            Navigator.of(context).pop();

          }, child: Text('OK')),

        ],

      );
    }
    );

  }

}
