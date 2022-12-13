import 'package:flutter/material.dart';

class EmptyTodosPlaceholder extends StatelessWidget {
  const EmptyTodosPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String quote =
        "To begin... To begin... How to start? I'm hungry. I should get coffee. Coffee would help me think. Maybe I should write something first, then reward myself with coffee. Coffee and a muffin. Okay, so I need to establish the themes. Maybe a banana-nut. That's a good muffin.";

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                '"$quote"',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              ),
              SizedBox(height: 13.0),
              Text(
                'Nicolas Cage',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
