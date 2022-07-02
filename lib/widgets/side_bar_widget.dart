import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeData.dark().scaffoldBackgroundColor,
      child: Column(
        children: [
          WindowTitleBarBox(
            child: Row(
              children: [
                Expanded(
                  child: WindowTitleBarBox(
                    child: MoveWindow(),
                  ),
                ),
                const WindowButtons(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
          colors: WindowButtonColors(
            iconNormal: Colors.white,
          ),
        ),
        MaximizeWindowButton(
          colors: WindowButtonColors(
            iconNormal: Colors.white,
          ),
        ),
        CloseWindowButton(
          colors: WindowButtonColors(
            iconNormal: Colors.white,
          ),
        ),
      ],
    );
  }
}
