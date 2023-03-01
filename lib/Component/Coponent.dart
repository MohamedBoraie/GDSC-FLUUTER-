import 'package:flutter/material.dart';

Widget Mybutton({
  double width = double.infinity,
  double? height,
  required Function? onPressed,
  required String? text,
  Color color = Colors.purple,
}) =>
    ElevatedButton(
      onPressed: () {
        onPressed!();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: color, minimumSize: Size(width, height!)),
      child: Text(
        text!.toUpperCase(),
        style: TextStyle(fontSize: 19),
      ),
    );
Widget MyTextFormField({
  TextEditingController? controller,
  TextInputType? keyboardType = TextInputType.text,
  required String? label,
  String? hint,

  bool obscure = false,
  Function? onTap,

  Function? onsubmitted,
  Function? suffixFunction,
  required String? Function(String?)? validator,
  Function? data,
  IconData? prefixIcon,
  IconData? suffixIcon,
  Color? labelColor,
  Color? prefixColor,
  Color? suffixColor,
}) =>
    Padding(
      padding: EdgeInsetsDirectional.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          color: Colors.purple,
        ),
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscure,
        onTap: () {
          onTap!();
        },
        onFieldSubmitted: (value) {
          onsubmitted!();
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: prefixColor,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: () {
                    suffixFunction!();
                  },
                  icon: Icon(
                    suffixIcon,
                    color: suffixColor,
                  ))
              : null,
          label: Text(
            label!,
            style: TextStyle(color: labelColor, fontWeight: FontWeight.w600),
          ),
          hintText: hint,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(.01),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.purple,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    var path = Path();
    path.lineTo(0, h / 1.25);
    path.cubicTo(w / 2 * 0.6, h * 0.6, w, h * 1.4, w * 1.2, h / 1.5);
    path.lineTo(w, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

Future MyNavigator(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
Future NavegateAndFinsh(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

