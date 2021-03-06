import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:songbook_flutter/constants.dart';
import 'package:songbook_flutter/models/song_data.dart';
import 'package:provider/provider.dart';
import 'package:songbook_flutter/screens/song_menu.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showSpinner = true;

  Future<void> loading(BuildContext context) async {
    print('entered main loading');
    await Firebase.initializeApp();
    await context.read<SongData>().loadDatabase();
    print('exiting main loading');
    Navigator.pushReplacementNamed(context, SongMenu.id);
  }

  @override
  void initState() {
    super.initState();
    loading(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Songbook',
            style: kWelcomeHeaderTextStyle,
          ),
        ),
      ),
    );
  }
}
