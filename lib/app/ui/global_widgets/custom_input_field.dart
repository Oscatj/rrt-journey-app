import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final void Function(String)? onChange;
  final String label;
  final TextInputType? inputType;
  final bool isPassword;
  final String? Function(String?)? validator; 

  const CustomInputField({
    Key? key, 
    this.onChange, 
    required this.label, 
    this.inputType, 
    this.isPassword = false, 
    this.validator,
    })
     : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {

  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.always,
      builder: (state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
          obscureText: _obscureText,
          keyboardType: widget.inputType,
          onChanged: (text){
            if (widget.validator != null){
              // ignore: invalid_use_of_protected_member
              state.setValue(text);
              state.validate();
            }
            if(widget.onChange != null){
              widget.onChange!(text);
            }
          },
          decoration: InputDecoration(
            labelText: widget.label,
            border: const OutlineInputBorder(),
            suffixIcon: widget.isPassword 
            ? CupertinoButton (
              child: Icon (_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: (){
                _obscureText = !_obscureText;
                setState(() {});
              },
            )
            : Container (
              width: 0,
            ),
          ),
    ),
    if (state.hasError)
        Text(
          state.errorText!,
          style: const TextStyle(color: Colors.redAccent),
        )
        ],
      );
    });
  }
}