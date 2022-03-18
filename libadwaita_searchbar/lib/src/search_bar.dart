import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdwSearchBar extends StatelessWidget {
  const AdwSearchBar({
    Key? key,
    this.search = const Icon(Icons.search, size: 18),
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
    this.fillColor,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.toggleSearchBar,
    this.hintText,
    this.constraints,
    this.outerConstraints,
  })  : textField = null,
        super(key: key);

  const AdwSearchBar.custom({
    Key? key,
    this.textField,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
    this.outerConstraints,
  })  : constraints = null,
        fillColor = null,
        search = null,
        toggleSearchBar = null,
        hintText = null,
        controller = null,
        onSubmitted = null,
        onChanged = null,
        super(key: key);

  final Widget? search;
  final EdgeInsets padding;
  final Widget? textField;
  final Color? fillColor;
  final String? hintText;
  final TextEditingController? controller;
  final Function({bool value})? toggleSearchBar;
  final ValueSetter<String>? onSubmitted;
  final ValueSetter<String>? onChanged;
  final BoxConstraints? constraints;
  final BoxConstraints? outerConstraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: Theme.of(context).appBarTheme.backgroundColor,
      constraints:
          outerConstraints ?? BoxConstraints.loose(const Size(500, 40)),
      child: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (event) {
          if (event.runtimeType == RawKeyDownEvent &&
              event.logicalKey.keyId == 4294967323) {
            toggleSearchBar?.call(value: false);
          }
        },
        child: textField ??
            TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                constraints:
                    constraints ?? BoxConstraints.loose(const Size(500, 36)),
                fillColor: fillColor ?? Theme.of(context).canvasColor,
                contentPadding: const EdgeInsets.only(top: 8),
                filled: true,
                isDense: true,
                hintText: hintText,
                prefixIcon: search,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onChanged: onChanged,
              onSubmitted: onSubmitted,
            ),
      ),
    );
  }
}
