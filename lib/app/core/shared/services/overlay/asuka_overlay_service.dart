import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

import 'i_overlay_service.dart';

class AsukaOverlayService implements IOverlayService {
  @override
  void showSnackBar(SnackBar widget) {
    asuka.showSnackBar(widget);
  }
}
