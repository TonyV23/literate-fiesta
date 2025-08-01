import 'package:flutter/material.dart';
import 'package:pablo/utils/app_textstyles.dart';

class CustomTextfield extends StatefulWidget {

    final String label;
    final IconData prefixIcon;
    final TextInputType keyboardType;
    final bool isPassword;
    final TextEditingController? controller;
    final String? Function(String?) ? validator;
    final void Function(String) ? onChanged;

    const CustomTextfield({
        super.key, required this.label,
        required this.prefixIcon,
        this.keyboardType = TextInputType.text,
        this.isPassword = false,
        this.controller,
        this.validator,
        this.onChanged
    });

    @override
    State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {

    bool _obscureText = true;

    @override
    Widget build(BuildContext context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword && _obscureText,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            onChanged: widget.onChanged,
            style: AppTextstyles.withColor(AppTextstyles.bodMedium, Theme.of(context).textTheme.bodyLarge!.color!),
            decoration: InputDecoration(labelText: widget.label, labelStyle: AppTextstyles.withColor(AppTextstyles.bodMedium, isDark
                        ? Colors.grey[400]! : Colors.grey[600]!), 
                prefixIcon: Icon(widget.prefixIcon, color: isDark ? Colors.grey[400]! : Colors.grey[600]! ,),
                suffixIcon: widget.isPassword ? IconButton(onPressed: () {
                            setState(() {
                                    _obscureText = !_obscureText;
                                });
                        }, icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility)) : null,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: isDark ? Colors.grey[700]! : Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: isDark ? Colors.grey[700]! : Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                )

            ));
    }
}

