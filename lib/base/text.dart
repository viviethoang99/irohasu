import 'package:flutter/material.dart';

class IrohaText extends StatelessWidget {
  const IrohaText.bold(
    this.title, {
    super.key,
    this.fontSize,
    this.overflow,
    this.color,
    this.textAlign,
    this.maxLines = 1,
    this.decoration,
    this.selectable = false,
    this.letterSpacing,
  }) : fontWeight = FontWeight.bold;

  const IrohaText.semibold(
    this.title, {
    super.key,
    this.fontSize,
    this.overflow,
    this.color,
    this.textAlign,
    this.maxLines = 1,
    this.decoration,
    this.selectable = false,
    this.letterSpacing,
  }) : fontWeight = FontWeight.w600;

  const IrohaText.medium(
    this.title, {
    super.key,
    this.fontSize,
    this.overflow,
    this.color,
    this.textAlign,
    this.maxLines = 1,
    this.decoration,
    this.selectable = false,
    this.letterSpacing,
  }) : fontWeight = FontWeight.w500;

  const IrohaText.regular(
    this.title, {
    super.key,
    this.fontSize,
    this.overflow,
    this.color,
    this.textAlign,
    this.maxLines = 1,
    this.decoration,
    this.selectable = false,
    this.letterSpacing,
  }) : fontWeight = FontWeight.w400;

  const IrohaText(
    this.title, {
    super.key,
    this.overflow = TextOverflow.clip,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.color,
    this.maxLines = 1,
    this.decoration,
    this.selectable = false,
    this.letterSpacing,
  });

  final String title;
  final TextOverflow? overflow;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;
  final TextDecoration? decoration;
  final bool selectable;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        title,
        maxLines: maxLines,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
              decoration: decoration,
            ),
      );
    } else {
      return Text(
        title,
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow ?? TextOverflow.clip,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
              decoration: decoration,
              letterSpacing: letterSpacing,
            ),
      );
    }
  }
}
