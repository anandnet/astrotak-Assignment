import 'package:flutter/material.dart';
class EmptyScreen extends StatelessWidget {
  const EmptyScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Content not available",
        style: TextStyle(fontSize: 20,color: Colors.grey),
      ),
    );
  }
}