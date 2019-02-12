import 'package:flutter/material.dart';

class CreateChallenge extends StatelessWidget {
  final VoidCallback close;

  const CreateChallenge({
    @required this.close,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: GestureDetector(
                onTap: close,
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Color(0xFFC4C4C4),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Icon(Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 42,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
