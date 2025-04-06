import 'package:flutter/material.dart';

class AnimatedExpandedWidgetPart2 extends StatefulWidget {
  const AnimatedExpandedWidgetPart2({super.key});

  @override
  State<AnimatedExpandedWidgetPart2> createState() => _AnimatedExpandedWidgetPart2State();
}

class _AnimatedExpandedWidgetPart2State extends State<AnimatedExpandedWidgetPart2> {
  bool isExpanded = false;
  bool hasCopied = false;
  bool hasCopied2 = false;
  int? activeIndex;
  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 2500);
    return Center(
      child: AnimatedContainer(
        onEnd: () {
          setState(() => hasCopied = true);
        },
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        height: 760 * (isExpanded ? 0.27 : 0.065),
        duration: duration,
        curve: Curves.elasticOut,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.fullscreen_rounded,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Rounded Corners",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.blue,
                      inactiveTrackColor:
                      const Color.fromARGB(255, 41, 39, 39),
                      trackOutlineColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return const Color(0xFF161616);
                            }
                            return const Color(0xFF161616);
                          }),
                      thumbColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.blue;
                            }
                            return Colors.white;
                          }),
                      value: isExpanded,
                      onChanged: (val) {
                        setState(() {
                          isExpanded = !isExpanded;
                          activeIndex = null;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CartItem(
                            isExpanded: isExpanded,
                            isActive: activeIndex == 0,
                            onTap: () => setState(() => activeIndex = 0),
                          ),
                          CartItem(
                            isExpanded: isExpanded,
                            isActive: activeIndex == 1,
                            onTap: () => setState(() => activeIndex = 1),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CartItem(
                            isExpanded: isExpanded,
                            isActive: activeIndex == 2,
                            onTap: () => setState(() => activeIndex = 2),
                          ),
                          CartItem(
                            isActive: activeIndex == 3,
                            isExpanded: isExpanded,
                            onTap: () => setState(() => activeIndex = 3),
                          ),
                        ],
                      )
                    ],
                  ),
                  TweenAnimationBuilder(
                    key: ValueKey(hasCopied),
                    curve: Curves.elasticOut,
                    tween: Tween<double>(
                        begin: hasCopied ? 1.0 : 1.2,
                        end: hasCopied ? 1.2 : 1.0),
                    onEnd: () {
                      setState(() => hasCopied = false);
                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() => hasCopied2 = false);
                      });
                    },
                    duration: const Duration(milliseconds: 500),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFFFFFFFF),
                          radius: 26,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                hasCopied = true;
                                hasCopied2 = true;
                              });
                            },
                            child: AnimatedCrossFade(
                              crossFadeState: !hasCopied2
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: const Duration(milliseconds: 200),
                              firstChild: const Icon(Icons.link),
                              secondChild: const Icon(Icons.check),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final bool isExpanded;
  final Function()? onTap;
  final bool isActive;
  const CartItem({
    super.key,
    required this.isExpanded,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 500);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: duration,
        height: MediaQuery.sizeOf(context).height * 0.09,
        width: 100,
        decoration: BoxDecoration(
          color: isActive
              ? Colors.blue.withOpacity(0.2)
              : !isExpanded
              ? const Color(0xFFFFFFFF)
              : const Color(0xFF161616),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "20",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
