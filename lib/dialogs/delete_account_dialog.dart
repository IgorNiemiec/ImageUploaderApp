

import 'package:flutter/material.dart' show BuildContext;
import 'package:image_uploader/dialogs/generic_dialog.dart';

Future<bool> showDeleteAccountDialog(
  BuildContext context
)
{
  return showGenericDialog<bool>(
    context: context,
    title: "Delete account", 
    content: "Are you sure you want to delete your account? This operation cannot be undone!", 
    optionsBuilder: () => 
    {
      "Cancel" : false,
      "Delete account" : true
    }
  ).then((value) => value ?? false);
}