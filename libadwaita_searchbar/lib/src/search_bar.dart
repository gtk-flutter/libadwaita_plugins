import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdwSearchBar extends StatelessWidget {
  const AdwSearchBar({
    Key? key,
    this.search = const Icon(Icons.search, size: 18),
    this.fillColor,
    this.controller,
    this.suggestions,
    this.onChanged,
    this.onSubmitted,
    this.toggleSearchBar,
    this.hintText,
    this.asyncSuggestions,
    this.constraints,
    this.outerConstraints,
  }) : super(key: key);

  final Widget search;
  final Color? fillColor;
  final String? hintText;
  final TextEditingController? controller;
  final Function({bool value})? toggleSearchBar;
  final List<String>? suggestions;
  final ValueSetter<String>? onSubmitted;
  final ValueSetter<String>? onChanged;
  final Future<List<String>> Function(String)? asyncSuggestions;
  final BoxConstraints? constraints;
  final BoxConstraints? outerConstraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
        child: EasyAutocomplete(
          asyncSuggestions: asyncSuggestions,
          suggestions: suggestions,
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
          suggestionBuilder: (data) => Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(data),
          ),
        ),
      ),
    );
  }
}
