import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.controller,
    this.onChanged,
    required this.hintText,
    this.suffixIcon,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.suffix,
  });

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String hintText;
  final IconData? suffixIcon;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Widget? suffix;

  static const textFieldBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 0.0));

  factory SearchWidget.searchButton(
      {required String hint, required Function()? onTap, FocusNode? fn}) {
    return SearchWidget(
        focusNode: fn,
        hintText: hint,
        suffixIcon: Icons.search,
        controller: TextEditingController(),
        onTap: onTap);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        enabled: true,
        focusNode: focusNode,
        onTap: onTap,
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary, height: 1.4),
        cursorHeight: 20,
        cursorWidth: 1.3,
        decoration: InputDecoration(
          fillColor: const Color(0xffD0D4DC).withOpacity(0.6),
          filled: true,
          contentPadding: const EdgeInsets.only(left: 14, right: 14),
          hintText: hintText,
          focusedBorder: textFieldBorder.copyWith(
              borderRadius: BorderRadius.circular(6.0)),
          enabledBorder: textFieldBorder.copyWith(
              borderRadius: BorderRadius.circular(6.0)),
          border: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.labelSmall,
          suffixIcon: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.search,
            ),
          ),
        ),
      ),
    );
  }
}
