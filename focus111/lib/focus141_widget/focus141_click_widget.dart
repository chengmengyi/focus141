import 'package:flutter/material.dart';

class Focus141ClickWidget extends StatelessWidget{
  Widget? child;
  Function()? focus141OnTap;
  Focus141ClickWidget({
    this.child,
    this.focus141OnTap,
});
  @override
  Widget build(BuildContext context) => InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: focus141OnTap,
    child: child,
  );
}