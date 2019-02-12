import 'package:flutter/material.dart';

class InvisiblePersistentHeaderDelegate extends SliverPersistentHeaderDelegate  {
  final double minSize;
  final double maxSize;

  InvisiblePersistentHeaderDelegate({
    @required this.minSize,
    @required this.maxSize,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container();
  }

  @override
  double get maxExtent => maxSize;

  @override
  double get minExtent => minSize;

  @override
  bool shouldRebuild(InvisiblePersistentHeaderDelegate oldDelegate) {
    return maxSize != oldDelegate.maxSize || minSize != oldDelegate.minSize;
  }
}
