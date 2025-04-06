import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:widgets_test_screen/listview_model.dart';

class ListViewScreeTest extends StatefulWidget {
  const ListViewScreeTest({super.key});

  @override
  State<ListViewScreeTest> createState() => _ListViewScreeTestState();
}

class _ListViewScreeTestState extends State<ListViewScreeTest> {
  List<Item> _items = <Item>[
    Item(title: 'Item 1', subtitle: 'Subtitle 1'),
    Item(title: 'Item 2', subtitle: 'Subtitle 2'),
    Item(title: 'Item 3', subtitle: 'Subtitle 3'),
    Item(title: 'Item 4', subtitle: 'Subtitle 4'),
    Item(title: 'Item 5', subtitle: 'Subtitle 5'),
    Item(title: 'Item 6', subtitle: 'Subtitle 6'),
    Item(title: 'Item 7', subtitle: 'Subtitle 7'),
    Item(title: 'Item 8', subtitle: 'Subtitle 8'),
    Item(title: 'Item 9', subtitle: 'Subtitle 9'),
    Item(title: 'Item 10', subtitle: 'Subtitle 10'),
  ];

  FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController();
  final AudioPlayer _audioPlayer =
      AudioPlayer(); // Create audio player instance
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    fixedExtentScrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    fixedExtentScrollController.removeListener(_onScroll);
    _audioPlayer.dispose(); // Dispose of audio player
    super.dispose();
  }

  void _onScroll() {
    int currentIndex = fixedExtentScrollController.selectedItem;
    if (currentIndex != _selectedIndex) {
      _selectedIndex = currentIndex;
      _playScrollSound();
    }
  }

  Future<void> _playScrollSound() async {
    // Use a local asset or network sound
    await _audioPlayer.setAudioSource(
        AudioSource.asset('assets/mp3s/minimal-pop-click-ui-13-198313.mp3'));
    // await _audioPlayer.play(
    //     'assets/mp3s/minimal-pop-click-ui-13-198313.mp3',
    //     isLocal: true,
    //     volume: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Test'),
      ),
      body: Container(
        height: 200,
        width: 250,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListWheelScrollView(
          controller: fixedExtentScrollController,
          physics: FixedExtentScrollPhysics(),
          itemExtent: 60.0,
          children: _items.map((item) {
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.title,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
/*
ListView.separated(
physics: FixedExtentScrollPhysics(),
separatorBuilder: (context, index) {
return Divider(thickness: 2, color: Colors.grey,);
},
itemCount: _items.length,
itemBuilder: (context, index) {
return Dismissible(
key: ValueKey(_items[index].title),
background: Container(
color: Colors.red,
alignment: Alignment.centerRight,
child: Icon(Icons.delete),
),
onDismissed: (direction) {
setState(() {
_items.removeAt(index);
});
},
child: ListTile(
title: Text(_items[index].title),
subtitle: Text(_items[index].subtitle),
trailing: IconButton(
onPressed: (){
setState(() {
_items.removeAt(index);
});
},
icon: Icon(_items[index].trailing,),),
),
);
},
)*/
