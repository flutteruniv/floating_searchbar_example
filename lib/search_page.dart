import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchPage> {
  late FloatingSearchBarController _floatingSearchBarController;
  @override
  void initState() {
    super.initState();
    _floatingSearchBarController = FloatingSearchBarController();
  }

  @override
  void dispose() {
    _floatingSearchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          FloatingSearchBar(
            controller: _floatingSearchBarController,
            hint: '誰を見つける？',
            actions: [
              FloatingSearchBarAction.searchToClear(
                showIfClosed: true,
              ),
            ],
            builder: (context, transition) {
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
