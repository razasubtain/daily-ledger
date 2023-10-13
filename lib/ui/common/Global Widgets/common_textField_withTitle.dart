import 'package:flutter/material.dart';

import '../ui_helpers.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField(
      {super.key,
      required this.cont,
      this.hintText = '',
      this.title = '',
      this.focusNode,
      this.onChange,
      this.enabled = true,
      this.ontap,
      this.searchField = false,
      this.nextFocusNode,
      this.maxLength,
      this.inputType = TextInputType.name});
  final TextEditingController cont;
  final String title;
  final String hintText;
  final TextInputType inputType;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Function? onChange;
  final bool searchField;
  final Function? ontap;
  final bool enabled;
  final int? maxLength;
  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          verticalSpaceSmall,
          TextFormField(
            onTap: () {
              widget.ontap != null ? widget.ontap!() : null;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter valid input';
              }
              return null;
            },
            enabled: widget.enabled,
            textInputAction: TextInputAction.done,
            focusNode: widget.focusNode,
            controller: widget.cont,
            onChanged: (value) {
              if (value.isEmpty) {
                setState(() {
                  widget.searchField ? widget.onChange!() : null;
                  isTapped = false;
                });
              } else {
                setState(() {
                  widget.searchField ? widget.onChange!() : null;
                  isTapped = true;
                });
              }
            },
            maxLength: widget.maxLength,
            onEditingComplete: () {
              widget.nextFocusNode == null
                  ? FocusScope.of(context).unfocus()
                  : FocusScope.of(context).requestFocus(widget.nextFocusNode);
            },
            keyboardType: widget.inputType,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: borderRadius),
                hintText: widget.hintText,
                alignLabelWithHint: true,
                hintStyle: const TextStyle(fontSize: 14)),
            textAlign: isTapped || widget.cont.text.isNotEmpty
                ? TextAlign.left
                : TextAlign.center,
          )
        ],
      ),
    );
  }
}
