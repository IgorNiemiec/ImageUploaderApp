
import 'package:flutter/material.dart' show BuildContext;
import 'package:image_uploader/auth/auth_error.dart';
import 'package:image_uploader/dialogs/generic_dialog.dart';

Future<void> showAuthError({ 
   required BuildContext context,
    required AuthError authError,}
)
{
  return showGenericDialog<bool>(
    context: context,
    title: authError.dialogTitle, 
    content: authError.dialogText, 
    optionsBuilder: () => 
    {
      "Ok" : true,
    });
}