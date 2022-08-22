import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/ui/Pages/login/utils/sign_in_with_google.dart';

import '../../../icons/oscar_icons.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButtom(
          color: Colors.red, 
          iconData: Oscar.google, 
          onPressed: ()=> singInWithGoogle(context),
        )
      ],
    );
  }
}

class SocialButtom extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData iconData;
  final Color color;
  
  const SocialButtom({
    Key? key, this.onPressed, 
    required this.iconData, 
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        padding: MaterialStateProperty.all(
          EdgeInsets.zero
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          )
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(50, 50)
        )
      ),
      child: SizedBox(
        width: 40,
        height: 40,
        child: Icon(iconData,
          
        ),
      )
    );
  }
}