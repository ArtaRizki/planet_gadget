import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

KeyboardActionsConfig buildConfigKeyboardClose(
    BuildContext context, FocusNode focusNode, {bool inDialog = false}) {
  return KeyboardActionsConfig(
    keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
    keyboardBarColor: Colors.grey[200],
    nextFocus: true,
    actions: [
      KeyboardActionsItem(
        focusNode: focusNode,
        toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () {
                node.unfocus();
                
                if(inDialog) {
                  Get.back();
                }

              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Close",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }
        ],
      ),
    ],
  );
}