import 'package:colored_print/colored_print.dart';
import 'package:flutter/material.dart';

abstract class BoardLog {
  static void error(Object message) => debugPrint(_red('-- $message'));
  static void warning(Object message) => debugPrint(_yellow('-- $message'));
  static void success(Object message) => debugPrint(_green('-- $message'));
  static void neutral(Object message) => debugPrint(_cyan('-- $message'));

  static String _red(String message) => PrintColor.red(message);
  static String _green(String message) => PrintColor.green(message);
  static String _yellow(String message) => PrintColor.yellow(message);
  static String _cyan(String message) => PrintColor.cyan(message);
}
