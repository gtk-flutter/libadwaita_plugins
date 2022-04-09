import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita_searchbar/libadwaita_searchbar.dart';

class AdwSearchBarAc extends StatelessWidget {
  const AdwSearchBarAc({
    Key? key,
    this.search = const Icon(Icons.search, size: 18),
    this.padding,
    this.fillColor,
    this.controller,
    this.suggestions,
    this.onChanged,
    this.onSubmitted,
    this.toggleSearchBar,
    this.hintText,
    this.asyncSuggestions,
    this.constraints,
  }) : super(key: key);

  final Widget? search;
  final EdgeInsets? padding;
  final Color? fillColor;
  final String? hintText;
  final TextEditingController? controller;
  final Function({bool value})? toggleSearchBar;
  final List<String>? suggestions;
  final ValueSetter<String>? onSubmitted;
  final ValueSetter<String>? onChanged;
  final Future<List<String>> Function(String)? asyncSuggestions;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return AdwSearchBar.custom(
      padding: padding,
      search: search,
      hintText: hintText,
      fillColor: fillColor,
      constraints: constraints,
      textField: (decoration) => EasyAutocomplete(
        asyncSuggestions: asyncSuggestions,
        suggestions: suggestions,
        controller: controller,
        autofocus: true,
        decoration: decoration,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        suggestionBuilder: (data) => Container(
          margin: const EdgeInsets.all(1),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Text(data),
        ),
      ),
    );
  }
}
