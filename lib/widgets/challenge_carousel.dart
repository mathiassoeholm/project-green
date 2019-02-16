import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge_mappings.dart';
import 'package:project_green/challenges/challenge_type.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/theme_values.dart';

class ChallengeCarousel extends StatefulWidget {
  // Start with a big number such the it allows scrolling left
  static const firstPageIndex = 1000;
  static const containerSize = 270.0;

  final Function(ChallengeType) onSelectType;

  const ChallengeCarousel({
    @required this.onSelectType,
  });

  @override
  _ChallengeCarouselState createState() => _ChallengeCarouselState();
}

class _ChallengeCarouselState extends State<ChallengeCarousel> {

  PageController controller;

  int currentPage = ChallengeCarousel.firstPageIndex;

  ChallengeType get selectedChallenge =>
    allChallengeTypes[currentPage%allChallengeTypes.length];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final screenWidth = MediaQuery.of(context).size.width;

    controller = PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: (ChallengeCarousel.containerSize)/screenWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) {
        setState(() {
          currentPage = value;
          widget.onSelectType(selectedChallenge);
        });
      },
      controller: controller,
      itemBuilder: buildItem,
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        var value = 1.0;
        var imageParallax = 0.0;

        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);

          imageParallax = (controller.page - index);
        }

        final easedValue = Curves.easeInOut.transform(value);
        final scale = lerpDouble(0.8, 1.0, easedValue);

        final challengeType = allChallengeTypes[index%allChallengeTypes.length];

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(scale, scale, scale),
          child: buildChallengeTypeBox(context, challengeType, imageParallax),
        );
      },
    );
  }

  Widget buildChallengeTypeBox(BuildContext context, ChallengeType type, double imageParallax) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  boxShadow: ThemeValues.carouselDropShadow,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.translationValues(imageParallax*20, 0, 0)*Matrix4.diagonal3Values(1.2, 1.2, 1),
                  child: Center(
                    child: Image.asset(ChallengeMappings.coverPath(type))
                  )
                ),
              ),
              Positioned(
                left: 0, bottom: 0, right: 0, height: 58,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22), bottomRight: Radius.circular(22))
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(AppLocalizations.of(context).getMediumChallengeTitle(type),
                      style: Theme.of(context).textTheme.button.merge(TextStyle(
                        color: Color(0xFF4C4A4A),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
}
