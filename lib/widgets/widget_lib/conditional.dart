import 'package:flutter/widgets.dart';

class Conditional extends StatelessWidget {
  final bool Function() predicate;
  final Widget child;

  const Conditional({
    Key key,
    @required this.child,
    @required this.predicate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(predicate()) {
      return child;
    } else {
      return Container(height: 0, width: 0);
    }
  }
}
