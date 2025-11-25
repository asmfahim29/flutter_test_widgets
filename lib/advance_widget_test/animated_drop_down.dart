import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CustomDropdownExample extends StatefulWidget {
  const CustomDropdownExample({super.key});

  @override
  State<CustomDropdownExample> createState() => _CustomDropdownExampleState();
}

class _CustomDropdownExampleState extends State<CustomDropdownExample> {
  final SingleSelectController<String?> jobRoleCtrl =
      SingleSelectController('');

  Future<List<String>> getFakeRequestData(String query) async {
    List<String> data = ['Developer', 'Designer', 'Consultant', 'Student'];

    return await Future.delayed(const Duration(seconds: 1), () {
      return data.where((e) {
        return e.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: CustomDropdown.searchRequest(
          futureRequest: getFakeRequestData,
          hintBuilder: (context, hint, enabled) {
            return Text(
              hint,
              style: const TextStyle(
                  color: Colors.black, decoration: TextDecoration.none),
            );
          },
          hintText: 'Search job role',
          onChanged: (value) {},
          controller: jobRoleCtrl,
          searchHintText: 'Developer',
          futureRequestDelay: const Duration(seconds: 3),
        ),
      ),
    );
  }
}
