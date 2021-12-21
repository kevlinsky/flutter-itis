import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  final String accountName;
  const Story({required this.accountName});

  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(height: 5,),
              Text(
                widget.accountName,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )
      ),
    );
  }
}