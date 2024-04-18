import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'grid_item.dart';
import 'grid_item_widget.dart';

void main() {
  runApp(Search());
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;
  late List<GridItem> _gridItems;
  late List<GridItem> _filteredGridItems;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _gridItems = [
      GridItem(name: 'Apple', imageUrl: 'https://via.placeholder.com/150'),
      GridItem(name: 'Ball', imageUrl: 'https://via.placeholder.com/150'),
      GridItem(name: 'Cat', imageUrl: 'https://via.placeholder.com/150'),
      GridItem(name: 'Dog', imageUrl: 'https://via.placeholder.com/150'),
      GridItem(name: 'Elephant', imageUrl: 'https://via.placeholder.com/150'),
      GridItem(name: 'Frog', imageUrl: 'https://via.placeholder.com/150'),
      GridItem(name: 'George', imageUrl: 'https://via.placeholder.com/150'),
      GridItem(name: 'Hen', imageUrl: 'https://via.placeholder.com/150'),
      GridItem(name: 'India', imageUrl: 'https://via.placeholder.com/150'),
      GridItem(name: 'Jack', imageUrl: 'https://via.placeholder.com/150'),
      GridItem(name: 'Kid', imageUrl: 'https://via.placeholder.com/150'),
      GridItem(name: 'Lang', imageUrl: 'https://via.placeholder.com/150'),
    ];
    _filteredGridItems = _gridItems;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterGridItems(String query) {
    setState(() {
      _filteredGridItems = _gridItems
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      _filterGridItems('');
                    },
                  ),
                ),
                onChanged: _filterGridItems,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: _filteredGridItems.isEmpty
                    ? const Center(child: Text('No items found'))
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: _filteredGridItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GridItemWidget(
                            name: _filteredGridItems[index].name,
                            imageUrl: _filteredGridItems[index].imageUrl,
                          );
                        },
                      ),
              ),
            ],
          ),
        ));
  }
}
