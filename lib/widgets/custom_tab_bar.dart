import 'package:flutter/cupertino.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:project_green/widgets/theme_values.dart';

class CustomTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: ThemeValues.listDropShadow
            ),
          ),
        ),
        CupertinoTabBar(
          activeColor: ThemeValues.green,
          items: [
            BottomNavigationBarItem(
                icon: Icon(OMIcons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(OMIcons.group),
            ),
            BottomNavigationBarItem(
              icon: Icon(OMIcons.equalizer),
            ),
            BottomNavigationBarItem(
              icon: Icon(OMIcons.person),
            ),
          ],
        ),
      ]
    );
  }
}
