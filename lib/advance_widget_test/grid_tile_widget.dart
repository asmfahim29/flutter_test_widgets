import 'package:flutter/material.dart';

class GridTileWidget extends StatelessWidget {
  const GridTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: GridTile(
              header: Container(
                color: Colors.black54,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Header',
                      style: TextStyle(decoration: TextDecoration.none, color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              footer: Container(
                color: Colors.black54,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Make Footer here !',
                      style: TextStyle(decoration: TextDecoration.none, color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              child: Image.network(
                'https://images.pexels.com/photos/18207346/pexels-photo-18207346/free-photo-of-view-of-a-mitsubishi-pajero-driving-on-a-dirt-road.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}
