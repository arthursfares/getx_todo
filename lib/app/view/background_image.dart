import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getx_todo/app/core/values/colors.dart';
import 'package:getx_todo/app/core/values/urls.dart';
import 'package:url_launcher/url_launcher.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      child: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.fill,
          child: InkWell(
            onTap: () {
              _showDialog(context, imagePageUrl);
            },
            child: Image.network(imageUrl),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context, String imageReferenceUrl) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Knight'),
        contentPadding: const EdgeInsets.only(
          top: 4,
          left: 24,
          right: 24,
          bottom: 24,
        ),
        content: SizedBox(
          height: MediaQuery.of(context).size.height / 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'by deomis',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 8.0),
              const Divider(),
              const SizedBox(height: 8.0),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'can be found ',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextSpan(
                      text: 'here',
                      style: const TextStyle(
                        color: orange,
                        fontSize: 16,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse(imageReferenceUrl));
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
