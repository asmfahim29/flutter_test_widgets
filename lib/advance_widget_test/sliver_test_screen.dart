import 'package:flutter/material.dart';

class CustomScrollScreen extends StatelessWidget {
  const CustomScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar with an image and back button
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Navigator.of(context).pop();
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Background image
                  Image.asset(
                    'assets/pexels-souvenirpixels-414612.jpg', // Replace with your image
                    fit: BoxFit.cover,
                  ),

                  // Centered text
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black54, // Semi-transparent background
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        'A Short Description',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


          // SliverPersistentHeader for the dropdown and reset button
          SliverPersistentHeader(
            pinned: true,
            delegate: DropdownHeaderDelegate(),
          ),

          // SliverList with ExpansionTile widgets
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
                return ExpansionTile(
                  title: Text('Student $index'),
                  subtitle: Text('Description of student $index'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Details about student $index.'),
                    ),
                  ],
                );
              },
              childCount: 9, // Number of students
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButton<String>(
            items: const [
              DropdownMenuItem(value: '1', child: Text('Option 1')),
              DropdownMenuItem(value: '2', child: Text('Option 2')),
            ],
            onChanged: (value) {},
            hint: const Text('Select an option'),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Reset action
            },
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 60.0; // Maximum height of the header

  @override
  double get minExtent => 60.0; // Minimum height of the header

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // Return true if any updates to the delegate require a rebuild
    return false;
  }
}


