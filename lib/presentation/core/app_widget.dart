import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:planet_gadget/presentation/core/bottom_nav_widget.dart';
import 'package:sizer/sizer.dart';

import '../../library/color.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => Listener(
        onPointerUp: (event) {
          if (Platform.isIOS) {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'Inter',
              primarySwatch: Colors.yellow,
              textSelectionTheme:
                  TextSelectionThemeData(selectionHandleColor: primaryBlue)),
          home: const BottomNavWidget(),
        ),
      ),
    );
  }
}
