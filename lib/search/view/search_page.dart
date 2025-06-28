import 'package:flutter/material.dart';

/// {@template search_page}
/// A page that allows users to search for a city.
/// {@endtemplate}
class SearchPage extends StatefulWidget {
  /// {@macro search_page}
  const SearchPage({super.key});

  /// Returns a route to the [SearchPage].
  static Route<String> route() {
    return MaterialPageRoute(builder: (_) => const SearchPage());
  }

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('City Search')),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  hintText: 'Chicago',
                ),
                onSubmitted: (value) => Navigator.of(context).pop(value),
              ),
            ),
          ),
          IconButton(
            key: const Key('searchPage_search_iconButton'),
            icon: const Icon(Icons.search, semanticLabel: 'Submit'),
            onPressed: () => Navigator.of(context).pop(_text),
          ),
        ],
      ),
    );
  }
}
