import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:libadwaita_searchbar_ac/libadwaita_searchbar_ac.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AdwaitaThemeData.light(),
      darkTheme: AdwaitaThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _searchController = TextEditingController();
    final toggleSearch = useState<bool>(false);
    final searchedTerm = useState<String>('');

    void toggleSearchBar({bool? value}) {
      searchedTerm.value = '';
      toggleSearch.value = value ?? !toggleSearch.value;
    }

    return AdwScaffold(
      headerbar: (_) => AdwHeaderBar(
        start: [
          AdwHeaderButton(
            isActive: toggleSearch.value,
            onPressed: toggleSearchBar,
            icon: const Icon(Icons.search, size: 20),
          ),
        ],
        title: toggleSearch.value
            ? AdwSearchBarAc(
                toggleSearchBar: toggleSearchBar,
                suggestions: const ['Hi', 'Hello'],
                onSubmitted: (str) => searchedTerm.value = str,
                controller: _searchController,
              )
            : const Text('Autocomplete demo'),
      ),
      body: Center(
        child: Text(
          searchedTerm.value.isNotEmpty
              ? searchedTerm.value
              : 'Libadwaita + Easy autocomplete search bar demo',
        ),
      ),
    );
  }
}
