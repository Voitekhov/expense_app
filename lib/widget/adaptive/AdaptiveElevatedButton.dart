import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// is better to use stateless widget?
class AdaptiveElevatedButton {
  static Widget of(String title, Function action) {
    Text text = Text(title);
    return Platform.isIOS
        ? CupertinoButton(
            color: Colors.indigo, child: text, onPressed: () => action)
        : ElevatedButton(onPressed: () => action, child: text);
  }
}
