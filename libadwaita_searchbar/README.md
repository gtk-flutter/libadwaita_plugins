Get a search bar for your libadwaita app with autocomplete suggestions.

## Usage

```dart
bool searchedTerm = '';

AdwSearchBar(
    suggestions: const ['Hi', 'Hello'],
    onSubmitted: (str) => setState(() => searchedTerm = str),
    controller: const TextEditingController(),
)
```

## Additional information

This package is dependent on `easy_autocomplete` for providing the autocomplete search, Hence when it gets updated then this package also needs to be updated.

This package is a part of [libadwaita](https://pub.dev/packages/libadwaita) package.