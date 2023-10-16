import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String imageAsset;
  final String title;
  final VoidCallback onPressed;

  const ImageButton({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 5.0, // You can adjust this value as desired
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Adjust for rounded corners
          side: BorderSide(color: Colors.grey.shade300, width: 0.1),
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(imageAsset,
                  width: 40,
                  height: 40,
                  fit: BoxFit.fitWidth), 
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w200)),
            ],
          ),
        ),
      ),
    );
  }
}
