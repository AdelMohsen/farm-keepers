import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

navigateTo(context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

navigateAndRemove(context, Widget widget) =>
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (
        route) => false);

AwesomeDialog defaultAwesomeDialog({context, Function? btnOkOnPress}) =>
    AwesomeDialog(
      btnCancelText: 'إلغاء الأمر',
      btnOkText: 'تأكيد الأمر',
      context: context,
      dialogType: DialogType.WARNING,
      borderSide: BorderSide(color: Colors.red, width: 2),
      width: double.infinity,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: 'هل تريد تأكيد الحذف',
      desc: 'إذا قمت بالحذف لن يمكن إعادته مره اخري',
      showCloseIcon: true,
      btnCancelOnPress: () {},
      btnOkOnPress: btnOkOnPress,
    )
      ..show();
