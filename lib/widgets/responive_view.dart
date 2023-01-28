import 'package:flutter/material.dart';

class ResponsiveView extends StatelessWidget {
  const ResponsiveView(
      {Key? key,
      required this.mobile,
      required this.tablet,
      required this.desktop})
      : super(key: key);
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth < 768) return mobile;
      if (constraint.minWidth >= 768 && constraint.maxWidth < 1080)
        return tablet;
      else
        return desktop;
    });
  }
}
