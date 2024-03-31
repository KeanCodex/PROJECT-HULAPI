import 'package:flutter/material.dart';

class Neubox extends StatelessWidget {
  const Neubox({super.key, this.children, this.color});
  final Widget? children;
  final Widget? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xffDBDBDB),
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 10,
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: Offset(-4, -4),
            ),
          ]),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
      child: children,
    );
  }
}

class ContainBox extends StatelessWidget {
  const ContainBox({super.key, this.children, this.color});
  final Widget? children;
  final Widget? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xffDBDBDB),
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 10,
                offset: Offset(4, 4),
              ),
              BoxShadow(
                color: Colors.white,
                blurRadius: 15,
                offset: Offset(-4, -4),
              ),
            ]),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
        child: children,
      ),
    );
  }
}
