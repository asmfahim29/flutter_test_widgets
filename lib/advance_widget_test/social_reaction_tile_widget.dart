import 'package:flutter/material.dart';
import 'package:reaction_askany/models/emotions.dart';
import 'package:reaction_askany/models/reaction_box_paramenters.dart';

import 'package:reaction_askany/reaction_askany.dart';

class SocialReactionTileWidget extends StatelessWidget {
  const SocialReactionTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ReactionWrapper(
        doubleTapLabel: "",
        handlePressed: (p0) {},
        handlePressedReactions: () {},
        initialEmotion: null,
        boxParamenters: ReactionBoxParamenters(
          brightness: Brightness.light,
          iconSize: 30,
          iconSpacing: 10,
          paddingHorizontal: 30,
          radiusBox: 40,
          quantityPerPage: 10,
        ),
        buttonReaction: const Padding(
          padding: EdgeInsets.only(top: 2.0),
          child: Icon(
            Icons.face_outlined,
            size: 40.0,
            color: Colors.grey,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 20.0,
          ),
          decoration: BoxDecoration(
            color: Colors.greenAccent.shade100,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            'Double Tap to See Reaction',
            style: TextStyle(
              decoration: TextDecoration.none,
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
