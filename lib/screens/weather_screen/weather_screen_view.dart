import 'package:flutter/material.dart';
import 'package:newapp/screens/widgets/input_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Column(
          children: [
            InputField(
              textEditingController: _searchController,
              label: 'Search Here',
              hint: 'City',
              prefixWidget: GestureDetector(
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              suffixWidget: const Icon(
                Icons.search,
                size: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
