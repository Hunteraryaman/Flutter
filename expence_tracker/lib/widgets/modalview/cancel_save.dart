import 'package:flutter/material.dart';

class CancelSave extends StatelessWidget {
  const CancelSave({super.key, required this.submitExpenceData});

  final void Function() submitExpenceData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        TextButton(
            //!cancel button
            onPressed: () {
              Navigator.pop(context); //this closes the modal overlay
              //this uses the context value from build to remove the overlay
            },
            child: const Text('Cancel')),
        ElevatedButton(
          //!save button
          onPressed: submitExpenceData,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
