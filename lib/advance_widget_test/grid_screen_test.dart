import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  final List<GridItem> items = [
    GridItem(name: "Item 1", imageUrl: "https://images.freeimages.com/images/large-previews/56d/peacock-1169961.jpg?fmt=webp&w=500"),
    GridItem(name: "Item 2", imageUrl: "https://images.freeimages.com/images/large-previews/bc4/curious-bird-1-1374322.jpg?fmt=webp&w=500"),
    GridItem(name: "Item 3", imageUrl: "https://images.freeimages.com/images/large-previews/9f9/selfridges-2-1470748.jpg?fmt=webp&w=500"),
    GridItem(name: "Item 4", imageUrl: "https://images.freeimages.com/images/large-previews/866/butterfly-1-1535829.jpg?fmt=webp&w=500"),
    GridItem(name: "Item 5", imageUrl: "https://images.freeimages.com/variants/pgFBx5hMEeeJ1s6eWuDjHBZe/f4a36f6589a0e50e702740b15352bc00e4bfaf6f58bd4db850e167794d05993d?fmt=webp&w=500"),

    GridItem(name: "Item 1", imageUrl: "https://images.freeimages.com/images/large-previews/56d/peacock-1169961.jpg?fmt=webp&w=500"),
    GridItem(name: "Item 2", imageUrl: "https://images.freeimages.com/images/large-previews/bc4/curious-bird-1-1374322.jpg?fmt=webp&w=500"),
    GridItem(name: "Item 3", imageUrl: "https://images.freeimages.com/images/large-previews/9f9/selfridges-2-1470748.jpg?fmt=webp&w=500"),
    GridItem(name: "Item 4", imageUrl: "https://images.freeimages.com/images/large-previews/866/butterfly-1-1535829.jpg?fmt=webp&w=500"),
    GridItem(name: "Item 5", imageUrl: "https://images.freeimages.com/variants/pgFBx5hMEeeJ1s6eWuDjHBZe/f4a36f6589a0e50e702740b15352bc00e4bfaf6f58bd4db850e167794d05993d?fmt=webp&w=500"),

    GridItem(name: "Item 1", imageUrl: "https://images.freeimages.com/images/large-previews/56d/peacock-1169961.jpg?fmt=webp&w=500"),
    GridItem(name: "Item 2", imageUrl: "https://images.freeimages.com/images/large-previews/bc4/curious-bird-1-1374322.jpg?fmt=webp&w=500"),
    GridItem(name: "Item 3", imageUrl: "https://images.freeimages.com/images/large-previews/9f9/selfridges-2-1470748.jpg?fmt=webp&w=500"),
    GridItem(name: "Item 4", imageUrl: "https://images.freeimages.com/images/large-previews/866/butterfly-1-1535829.jpg?fmt=webp&w=500"),
    GridItem(name: "Item 5", imageUrl: "https://images.freeimages.com/variants/pgFBx5hMEeeJ1s6eWuDjHBZe/f4a36f6589a0e50e702740b15352bc00e4bfaf6f58bd4db850e167794d05993d?fmt=webp&w=500"),
    GridItem(name: "Item 6", imageUrl: "https://images.freeimages.com/variants/2nWZ2oM6P683by9Nnevqv1yJ/f4a36f6589a0e50e702740b15352bc00e4bfaf6f58bd4db850e167794d05993d?fmt=webp&w=500"),
  ];

  GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Professional GridView'),
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 8.0, // Spacing between rows
          childAspectRatio: 0.9, // Aspect ratio for each grid item
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class GridItem {
  final String name;
  final String imageUrl;

  GridItem({required this.name, required this.imageUrl});
}
