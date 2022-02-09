import 'package:exam_second/core/components/exporting.dart';

class MyEdgeInsets {

static only(
          {required BuildContext context,
          double top = 0.0,
          double bottom = 0.0,double left = 0.0,
          double right = 0.0}) =>
      EdgeInsets.only(
        top: MediaQuery.of(context).size.height * top,
        left: MediaQuery.of(context).size.height * left,
        right: MediaQuery.of(context).size.height * right,
        bottom: MediaQuery.of(context).size.height * bottom,
      );

  static symmetric(
          {required BuildContext context,
          double horizontal = 0.0,
          double vertical = 0.0}) =>
      EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.height * horizontal,
        vertical: MediaQuery.of(context).size.height * vertical,
      );

  static all(BuildContext context, double size) => EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.height * size,
        vertical: MediaQuery.of(context).size.height * size,
      );
}
