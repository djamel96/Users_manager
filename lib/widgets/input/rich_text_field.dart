import 'package:charlie/them/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef VoidCallbackWithBoolArg = void Function(bool value);

class RichTextField extends StatefulWidget {
  final Key? key;
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final bool obscureText;
  final bool required;
  final Widget? prefixIcon;
  final Widget? prefixIconDisabled;
  final Widget? postfix;
  final VoidCallbackWithBoolArg? onFocus;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onTap;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final Widget? stackTopLayer;
  final TextInputType? keyboardType;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final String? errorText;
  final String? initialValue;
  final double? marginsHorizotal;
  final double? marginVertical;
  final int? maxLines;
  final String? label;
  final TextStyle? labelStyle;
  final Widget? suffixIcon;
  final Color borderColor;
  final Color fillColor;
  final double borderHeight;
  final double? height;
  final double? width;
  final bool autofocus;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final bool multiLine;
  final TextCapitalization textCapitalization;
  final AlignmentGeometry? labelAlignment;
  RichTextField({
    this.key,
    this.controller,
    this.style,
    this.hintText,
    this.hintStyle,
    this.obscureText = false,
    this.readOnly = false,
    this.prefixIcon,
    this.prefixIconDisabled,
    this.postfix,
    this.onFocus,
    this.validator,
    this.onSaved,
    this.onTap,
    this.onChanged,
    this.stackTopLayer,
    this.keyboardType,
    this.contentPadding,
    this.textAlign,
    this.inputFormatters,
    this.maxLength,
    this.errorText,
    this.initialValue,
    this.marginsHorizotal,
    this.marginVertical,
    this.maxLines,
    this.label,
    this.labelStyle,
    this.suffixIcon,
    this.borderColor = AppColors.grey187,
    this.fillColor = Colors.transparent,
    this.borderHeight = .5,
    this.height,
    this.width,
    this.autofocus = false,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.multiLine = false,
    this.textCapitalization = TextCapitalization.none,
    this.required = false,
    this.labelAlignment,
  });

  @override
  State<RichTextField> createState() => _RichTextFieldState();
}

class _RichTextFieldState extends State<RichTextField> {
  final FocusNode _focus = FocusNode();
  Widget? _prefixIcon;
  bool _hidePassword = false;
  bool _isPassword = false;

  @override
  void initState() {
    super.initState();
    _isPassword = (widget.obscureText != null) ? widget.obscureText : false;
    _hidePassword = _isPassword;
    _focus.addListener(_onFocusChange);
  }

  void _setPrefixIcon() {
    setState(() {
      if (widget.prefixIconDisabled != null && !_focus.hasFocus) {
        _prefixIcon = widget.prefixIconDisabled;
      } else {
        _prefixIcon = widget.prefixIcon;
      }
    });
  }

  void _onFocusChange() {
    _setPrefixIcon();
    if (widget.onFocus != null) widget.onFocus!(_focus.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    _setPrefixIcon();

    return Column(
      //mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        widget.label != null
            ? Container(
                alignment: widget.labelAlignment,
                margin: const EdgeInsets.only(bottom: 8),
                child: RichText(
                  text: TextSpan(
                      text: widget.label ?? '',
                      style: widget.labelStyle?.copyWith(
                            color:
                                _focus.hasFocus ? AppColors.appMain100 : null,
                          ) ??
                          TextStyle(
                              color: _focus.hasFocus
                                  ? AppColors.appMain100
                                  : AppColors.formInput,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                      children: widget.required
                          ? const [
                              TextSpan(
                                text: ' *',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.red201),
                              ),
                            ]
                          : []),
                ),
              )
            : const Center(),
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            initialValue: widget.initialValue,
            textCapitalization: widget.textCapitalization,
            maxLength: widget.maxLength,
            maxLines: widget.multiLine ? null : (widget.maxLines ?? 1),
            // when maxLength is setup, by default TextField widget will build a counter under it to display the chars count,
            // for now this counter is unneeded in all cases so we just return null:
            buildCounter: (BuildContext context,
                    {int? currentLength, int? maxLength, bool? isFocused}) =>
                null,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            textAlign: widget.textAlign ?? TextAlign.start,
            controller: widget.controller,
            readOnly: widget.readOnly,
            obscureText: _hidePassword,
            focusNode: _focus,
            cursorColor: AppColors.appMain100,
            autofocus: widget.autofocus,
            autocorrect: false,
            style: widget.style ??
                const TextStyle(
                    fontSize: 16.0,
                    height: 1,
                    color: AppColors.formInput,
                    fontWeight: FontWeight.w400),
            decoration: InputDecoration(
                prefixIcon: _prefixIcon != null
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 12),
                          _prefixIcon!,
                        ],
                      )
                    : null,
                suffixIconConstraints: widget.suffixIconConstraints,
                prefixIconConstraints: widget.prefixIconConstraints,
                suffixIcon: (_isPassword == true)
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: .0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          child: Icon(
                            _hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 22,
                            color: widget.borderColor,
                          ),
                          onTap: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                        ))
                    : widget.suffixIcon,
                filled: true,
                fillColor: widget.fillColor,
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ??
                    const TextStyle(
                      color: AppColors.grey205,
                      fontSize: 14,
                      height: 1,
                    ),
                contentPadding: widget.contentPadding ??
                    (widget.maxLines != null
                        ? const EdgeInsets.only(left: 16, top: 10, right: 16)
                        : const EdgeInsets.fromLTRB(16, 10.0, 25.0, 10.0)),
                border: InputBorder.none,
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(width: 1, color: Colors.redAccent),
                ),
                errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  borderSide: BorderSide(width: 1, color: AppColors.appMain100),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                  borderSide: BorderSide(width: 1, color: widget.borderColor),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                  borderSide: BorderSide(width: 1, color: Colors.red[400]!),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorText: widget.errorText ?? null),
            validator: widget.validator,

            onSaved: widget.onSaved,
            onTap: widget.onTap,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
