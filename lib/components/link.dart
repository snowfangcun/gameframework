import 'package:flutter/material.dart';

class Node{
  void start(){}
}





class Link extends StatefulWidget {
  final String text;

  const Link({super.key, required this.text});

  @override
  State<StatefulWidget> createState() => _LinkState();
}

enum LinkState {
  normal,
  hover,
}

class _LinkState extends State<Link> {
  late ThemeData themeData;
  late TextStyle textStyle;
  late TextStyle currentTextStyle;
  var linkState = LinkState.normal;

  void onLinkHover() {
    setState(() {
      linkState = LinkState.hover;
    });
  }

  void onLinkExit() {
    setState(() {
      linkState = LinkState.normal;
    });
  }

  
  /// 基于当前link的状态[LinkState]获取文本样式
  TextStyle getStyle() {
    return switch (linkState) {
      LinkState.normal => TextStyle(color: themeData.colorScheme.onBackground),
      LinkState.hover => TextStyle(
          color: themeData.colorScheme.onPrimary,
          decoration: TextDecoration.underline,
          decorationColor: themeData.colorScheme.onPrimary),
    };
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return MouseRegion(
      child: GestureDetector(
        child: Text(
          widget.text,
          style: getStyle(),
        ),
        onTap: () => print('link点击'),
      ),
      onHover: (event) => onLinkHover(),
      onExit: (event) => onLinkExit(),
    );
  }
}
