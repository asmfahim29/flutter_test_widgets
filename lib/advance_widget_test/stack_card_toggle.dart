import 'dart:math';

import 'package:flutter/material.dart';

class StackCardToggle extends StatefulWidget {
  const StackCardToggle({super.key});

  @override
  State<StackCardToggle> createState() => _StackCardToggleState();
}

class _StackCardToggleState extends State<StackCardToggle> {
  bool isExpanded = true;

  List<CardItem> items = [
    CardItem(
        title: "Firebase",
        date: "April 2012",
        subtitle: "Acquired by Google in 2014"),
    CardItem(
        title: "Flutter", date: "May 2017", subtitle: "Developed by Google"),
  ];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isExpanded = !isExpanded;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: pi,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(items.length, (i) => i).map((index) {
                    final scaleFactor = isExpanded
                        ? 1.0
                        : 1 - (items.length - 1.0 * index) / 30;
                    final item = items[index];
                    return AnimatedAlign(
                      duration: const Duration(milliseconds: 2500),
                      alignment: Alignment.center,
                      curve: Curves.elasticInOut,
                      heightFactor: isExpanded ? 1.2 : 0.15,
                      child: AnimatedScale(
                        scale: scaleFactor,
                        duration: const Duration(milliseconds: 2500),
                        alignment: Alignment.center,
                        curve: Curves.elasticInOut,
                        child: Transform.rotate(
                          angle: pi,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 38, 37, 37),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 2,
                                    spreadRadius: 1),
                              ],
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                    color: Colors.black.withOpacity(0.1)),
                              ),
                              leading: Container(
                                width: 50,
                                height: 50,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  width: 50,
                                  height: 50,
                                  'https://images.unsplash.com/photo-1731441363093-ddd9ed90fca5?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                ),
                              ),
                              title: Text(item.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18)),
                              subtitle: Text(item.subtitle),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
          TweenAnimationBuilder(
            key: ValueKey(isExpanded),
            tween: isExpanded
                ? Tween(begin: 1.0, end: 0.0)
                : Tween<double>(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 2500),
            builder: (context, value, child) {
              return ElevatedButton(
                //iconAlignment: IconAlignment.end,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(value <= 0.5 ? "Hide" : "Show All"),
                    Icon(value >= 0.5
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up_rounded),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class CardItem {
  final String title;
  final String date;
  final String subtitle;

  CardItem({required this.title, required this.date, required this.subtitle});
}
