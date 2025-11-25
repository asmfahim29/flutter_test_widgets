import 'package:flutter/material.dart';



class SecondarySearchField extends StatefulWidget {
  const SecondarySearchField({Key? key}) : super(key: key);

  @override
  _SecondarySearchFieldState createState() => _SecondarySearchFieldState();
}

class _SecondarySearchFieldState extends State<SecondarySearchField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PrimaryContainer(
          radius: 10,
          child: TextField(
            onChanged: (value) {},
            style: const TextStyle(fontSize: 16, color: Colors.white),
            textAlignVertical: TextAlignVertical.center,
            controller: TextEditingController(),
            focusNode: _focusNode,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 3),
              border: InputBorder.none,
              suffixIcon: Container(
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _isFocused ? Colors.cyan : Colors.grey,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Icon(Icons.search, size: 24, color: _isFocused ? Colors.white : Colors.black,),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.cyan),
              ),
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: 'Search',
              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;
  const PrimaryContainer({
    Key? key,
    this.radius,
    this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .06,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 30),
        boxShadow: [
          BoxShadow(
            color: color ?? const Color(0XFF1E1E1E),
          ),
          const BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black,
            //inset: true,
          ),
        ],
      ),
      child: child,
    );
  }
}

