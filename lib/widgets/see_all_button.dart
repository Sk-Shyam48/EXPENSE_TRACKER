import 'package:flutter/material.dart';

class SeeAllButton extends StatefulWidget {
  const SeeAllButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SeeAllButtonState createState() => _SeeAllButtonState();
}

class _SeeAllButtonState extends State<SeeAllButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
          });
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: _isPressed
                ? const Color.fromRGBO(141, 92, 246, 1)
                : Colors.grey.shade300,
            width: 2,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'See All',
              style: TextStyle(
                fontSize: 14,
                color: _isPressed
                    ? const Color.fromRGBO(141, 92, 246, 1)
                    : Colors.black,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              size: 20,
              color: _isPressed
                  ? const Color.fromRGBO(141, 92, 246, 1)
                  : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
