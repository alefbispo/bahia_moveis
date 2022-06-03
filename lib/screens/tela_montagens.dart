import 'package:flutter/material.dart';

class TelaMontagens extends StatelessWidget {
  const TelaMontagens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: ((context, index) {
      return const Text('data');
    }));
  }
}
