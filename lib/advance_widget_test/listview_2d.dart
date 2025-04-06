import 'package:flutter/material.dart';

class TwoDListViewBuilderWidget extends StatelessWidget {
  const TwoDListViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Section ${index + 1}',
                  style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 150, // Height for horizontal scrollable area
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10, // Number of horizontal items
                  itemBuilder: (context, index) {
                    return Container(
                      width: 120,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(12), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset:
                            const Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        'https://images.pexels.com/photos/1553783/pexels-photo-1553783.jpeg?auto=compress&cs=tinysrgb&w=600${index + 1}',
                        fit:
                        BoxFit.cover, // Ensure the image covers the container
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
