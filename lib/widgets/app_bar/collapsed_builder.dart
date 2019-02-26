import 'package:flutter/material.dart';

typedef CollapsedWidgetBuilder = Widget Function(
  BuildContext context,
  double collapseFactor,
);

class CollapsedBuilder extends StatelessWidget {
  final Stream<double> stream;
  final CollapsedWidgetBuilder builder;

  const CollapsedBuilder({
    @required this.stream,
    @required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: stream,
      builder: (context, snapshot) {
        final collapseFactor = snapshot.hasData
            ? snapshot.data
            : 0.0;

        return builder(context, collapseFactor);
      },
    );
  }
}
