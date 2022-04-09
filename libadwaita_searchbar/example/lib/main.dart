import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:libadwaita_searchbar/libadwaita_searchbar.dart';

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
            ? AdwSearchBar(
                search: null,
                toggleSearchBar: toggleSearchBar,
                onSubmitted: (str) => searchedTerm.value = str,
                controller: _searchController,
              )
            : const Text('Search bar demo'),
      ),
      body: Center(
        child: Text(
          searchedTerm.value.isNotEmpty
              ? searchedTerm.value
              : 'Libadwaita + Search bar demo',
        ),
      ),
    );
  }
}
