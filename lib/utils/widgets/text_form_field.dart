import 'package:flutter/material.dart';
import 'package:starbucks_redesign/constants/colors.dart';

class TextFormInput extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String? label;
  final String? suffixText;
  final String? hintText;

  final TextStyle? textStyle;
  final VoidCallback? onTapCb;
  final bool? isEnabled;
  final Icon? suffixIcon;
  final Icon? prefixIcon;

  const TextFormInput({
    Key? key,
    this.textEditingController,
    this.label,
    this.suffixText,
    this.hintText,
    this.textStyle,
    this.onTapCb,
    this.isEnabled,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  @override
  _TextInput createState() => _TextInput();
}

class _TextInput extends State<TextFormInput> {
  FocusNode? _node;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _node = FocusNode(debugLabel: 'Button');
    _node!.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (_node!.hasFocus != _focused) {
      setState(() {
        _focused = _node!.hasFocus;
      });
    }
  }

  @override
  void dispose() {
    _node!.removeListener(_handleFocusChange);
    _node!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: widget.textStyle,
        enabled: widget.isEnabled ?? true,
        onTap: widget.onTapCb,
        focusNode: _node,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: AppColors.darkGreen, fontSize: 16, fontWeight: FontWeight.w500),
          border: InputBorder.none,
          fillColor: Colors.white,
          prefixIcon: widget.prefixIcon,
          suffix: Text(
            widget.suffixText ?? "",
            style: const TextStyle(color: AppColors.darkGreen, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          labelText: widget.label,
        ));
  }
}
