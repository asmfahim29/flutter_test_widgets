import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalStepper extends StatefulWidget {
  const HorizontalStepper({super.key});

  @override
  State<HorizontalStepper> createState() => _HorizontalStepperState();
}

class _HorizontalStepperState extends State<HorizontalStepper> {
  int _currentStep = 0;
  int _rating = 0;

  List<Step> stepList() => [
    Step(
      title: const Text('Info'),
      isActive: _currentStep >= 0,
      state: _currentStep <= 0 ? StepState.editing : StepState.complete,
      content: const Column(
        children: [
          ListTile(
            leading: Icon(Icons.person, color: Colors.red),
            title: Text(
              'Username: johndoe',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            subtitle: Text('This is your public username'),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.cake, color: Colors.pink),
            title: Text(
              'Birthday: January 1, 1990',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            subtitle: Text('Your birth date'),
          ),
        ],
      ),
    ),
    Step(
      title: const Text('Address'),
      isActive: _currentStep >= 1,
      state: _currentStep <= 1 ? StepState.editing : StepState.complete,
      content: const Column(
        children: [
          ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.red),
            title: Text(
              'Home Address: 123 St',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            subtitle: Text('Street and number'),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.red),
            title: Text(
              'City: Springfield',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            subtitle: Text('Your city of residence'),
          ),
        ],
      ),
    ),
    Step(
      title: const Text('Rate'),
      isActive: _currentStep >= 2,
      state: _currentStep == 2 ? StepState.editing : StepState.complete,
      content: Column(
        children: [
          const Text(
            'Rate your experience',
            style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 36,
                ),
                onPressed: () {
                  setState(() {
                    _rating = index + 1;
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 16),
          Text(
            'You selected $_rating star${_rating != 1 ? 's' : ''}',
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stepper(
          steps: stepList(),
          type: StepperType.horizontal,
          elevation: 0,
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < (stepList().length - 1)) {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              children: [
                if (_currentStep > 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepCancel,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
