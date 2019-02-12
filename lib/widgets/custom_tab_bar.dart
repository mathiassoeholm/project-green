import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:project_green/widgets/theme_values.dart';

class CustomTabBar extends StatelessWidget {

  static const totalHeight = 78.0;
  static const tabBarHeight = 50.0;
  static const addButtonSize = 66.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0, bottom: 0, right: 0, top: totalHeight-tabBarHeight,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: ThemeValues.listDropShadow
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: totalHeight-tabBarHeight),
          child: CupertinoTabBar(
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
        ),
        Positioned(
          left: 0, right: 0, bottom: 0, top: 0,
          child: Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () { },
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
            ),
          )
        ),
      ]
    );
  }
}
