import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:project_green/widgets/theme_values.dart';

class CustomTabBar extends StatelessWidget {

  static const totalHeight = 75.0;
  static const tabBarHeight = 50.0;
  static const addButtonSize = 66.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: ThemeValues.listDropShadow
            ),
          ),
        ),
        CupertinoTabBar(
          backgroundColor: Color(0xBBFFFFFF),
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
        Positioned(
          left: 0, right: 0, bottom: 0, top: -tabBarHeight,
          child: Center(
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Center(
                        child: Container(
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        )
                    )
                ),
                Icon(Icons.filter_vintage,
                  size: addButtonSize,
                  color: ThemeValues.green,
                ),
                Positioned.fill(
                  child: Center(
                    child: Icon(Icons.add,
                      color: ThemeValues.green,
                    ),
                  )
                )
              ]
            ),
          )
        ),
      ]
    );
  }
}
