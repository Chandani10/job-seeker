/*============================================Text widget======================================*/
import 'package:flutter/material.dart';
import 'package:job_seeker/constants/app_colors.dart';

Widget textWidget({
  String? title,
  Color? textColor,
  double? fontSize,
  int? maxLines,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  TextOverflow? textOverflow = TextOverflow.ellipsis,
  TextDecoration? decoration
}) =>
    Text(
      title!,
      maxLines: maxLines ?? 1,
      textAlign: textAlign,
      style: TextStyle(
          decoration: decoration,
          fontFamily: 'Mulish',
          overflow: textOverflow,
          fontWeight: fontWeight,
          color: textColor ?? blackColor,
          fontSize: fontSize ?? 18,
      ),
    );

/*===========================================Size box widget=====================================*/
extension EmptyPadding on num {
  SizedBox get ph => SizedBox(
    height: toDouble(),
  );

  SizedBox get pw => SizedBox(
    width: toDouble(),
  );
}

/*==========================================error Widget====================================*/

errorWidget(){
  return Center(child: textWidget(title: "Error fetching jobs",maxLines: 2,textAlign:TextAlign.center ));
}
/*=========================================loading Widget===================================*/

loadingWidget(){
  return const Center(child: CircularProgressIndicator(color: appColor,));
}