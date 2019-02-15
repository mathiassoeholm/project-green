import 'package:flutter/material.dart';
import 'package:project_green/widgets/challenge_carousel.dart';
import 'package:project_green/widgets/green_button.dart';
import 'package:project_green/widgets/theme_values.dart';

class CreateChallenge extends StatelessWidget {
  final VoidCallback close;

  const CreateChallenge({
    @required this.close,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ThemeValues.lightBackground,
      child: SafeArea(
        left: false,
        right: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 236,
                child: ChallengeCarousel()
              ),
            ),
            Flexible(
              flex: 1,
              child: Text('asdfasasdfa\nasdfasasdfa\nasdfasasdfa\nasdfasasdfa\nasdfasasdfa\nasdfasasdfa',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GreenButton(
                onTap: close,
                text: 'LET’S DO IT!',
              ),
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
      ),
    );
  }
}
