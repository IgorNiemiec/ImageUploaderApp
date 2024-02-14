

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_uploader/bloc/app_bloc.dart';
import 'package:image_uploader/bloc/app_event.dart';
import 'package:image_uploader/dialogs/delete_account_dialog.dart';
import 'package:image_uploader/dialogs/logout_dialog.dart';

enum MenuAction
{
  logout,
  deleteAccount,
}

class MainPopupMenuButton extends StatelessWidget
{
  const MainPopupMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return PopupMenuButton<MenuAction>(
      onSelected: (value) async
      {
        switch(value)
        {
          case MenuAction.logout:
          final shouldLogOut = await showLogOutDialog(context);

          if (shouldLogOut)
          {
            context.read<AppBloc>().add(
              const AppEventLogOut()
            );
          }

          break;
          case MenuAction.deleteAccount:

           final shouldDeletAcount = await showDeleteAccountDialog(context);

          if (shouldDeletAcount)
          {
            context.read<AppBloc>().add(
              const AppEventDeleteAccount(),
            );
          }
          break;
          
        }
      },
      itemBuilder: (context)
      {
        return [
          const PopupMenuItem<MenuAction>(
            value: MenuAction.logout,
            child: Text("Log out"),
          ),
            const PopupMenuItem<MenuAction>(
            value: MenuAction.deleteAccount,
            child: Text("Delete account"),
          ),

        ];
      });
  }
}