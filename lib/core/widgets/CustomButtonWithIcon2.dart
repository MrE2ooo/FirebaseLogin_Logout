
import 'package:firelogin/core/widgets/spacewidget.dart';
import 'package:flutter/material.dart';


class CustomButtonWithIcon2 extends StatelessWidget {
  const CustomButtonWithIcon2(
      {super.key, required this.text, this.onTap, this.iconData, this.color});
  final String text;
  final IconData? iconData;
  final VoidCallback? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
       
        
        decoration: const BoxDecoration(
            color: Colors.transparent,
            
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: color,
            ),
            const HorizintalSpace(2),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}