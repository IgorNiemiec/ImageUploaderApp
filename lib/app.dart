
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_uploader/bloc/app_bloc.dart';
import 'package:image_uploader/bloc/app_event.dart';
import 'package:image_uploader/bloc/app_state.dart';
import 'package:image_uploader/dialogs/show_auth_error.dart';
import 'package:image_uploader/loading/loading_screen.dart';
import 'package:image_uploader/views/login_view.dart';
import 'package:image_uploader/views/photo_gallery_view.dart';
import 'package:image_uploader/views/register_view.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (_) => AppBloc()..add(const AppEventInitialize()),
      child: MaterialApp(
        title: "Image uploader",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<AppBloc,AppState>(
          listener: (context, appstate) {

            if (appstate.isLoading)
            {
              LoadingScreen.instance().show(context: context, text: "Loading");
            }
            else
            {
              LoadingScreen.instance().hide();
            }

            final authError = appstate.authError;

            if (authError!= null)
            {
              showAuthError(context: context, authError: authError);
            }
            
          },
          builder: (context, appstate) {
            if (appstate is AppStateLoggedOut)
            {
              return const LoginView();
            }
            else if (appstate is AppStateLoggedIn)
            {
              return const PhotoGalleryView();
            }
            else if (appstate is AppStateIsInRegistrationView)
            {
              return const RegisterView();
            }
            else
            {
              return Container();
            }
          },
        ),
      ),
      );
  }
}

