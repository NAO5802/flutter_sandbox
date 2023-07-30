import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320,
        height: 240,
        // color: Colors.grey[300],
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(1.5),
          child: _getRedContainer(),
        )
    );
  }

  TextStyle _getTextStyle() {
    return TextStyle(
      fontFamily: "Georgia",
      fontSize: 24,
      fontWeight: FontWeight.bold,
      letterSpacing: 8,
    );
  }

  RichText _getRichText(){
    return RichText(
      text: TextSpan(
        style: _getTextStyle(),
        children: const <TextSpan>[
          TextSpan(text: 'hello'),
          TextSpan(
              text: 'world',
             style: TextStyle(
               fontWeight: FontWeight.w300,
               fontStyle: FontStyle.italic,
               fontSize: 48,
             )
          )
        ]
      )
    );
  }

  Center _getRedContainer() {
    return Center(
      child: Container(
        width: 160,
        // height: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red[400],
          // shape: BoxShape.circle,
          // borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(
          'hello world Lorem ipsum dolor sit amet, consec etur',
          style: _getTextStyle(),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
            maxLines: 2,
        ),
      ),
    );
  }
}
