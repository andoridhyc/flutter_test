import 'package:flutter/material.dart';

/// 通用弹窗
Future<T?> showCustomDialog<T>(context, content, {barrierDismissible = true}) {
  return showDialog(
      context: context,
      barrierDismissible: barrierDismissible, //点击外边灰色区域是否可以关闭弹窗
      builder: (context) {
        return content;
      });
}

/// 底部弹窗
Future<T?> showModalBottomSheetDialog<T>(context, builder) {
  return showModalBottomSheet(
    context: context,
    builder: builder,
    isScrollControlled: true,
  );
}
