import 'package:at_sync_ui_flutter/at_sync_ui.dart';
import 'package:at_sync_ui_flutter/at_sync_ui_flutter.dart';
import 'ui_options.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class HomeScreen extends StatefulWidget {
  final String activeAtSign;
  const HomeScreen({required this.activeAtSign, Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String activeAtSign;

  @override
  void initState() {
    try {
      super.initState();
      activeAtSign = widget.activeAtSign;
      AtSyncUIService().init(
        appNavigator: NavService.navKey,
        onSuccessCallback: _onSuccessCallback,
        onErrorCallback: _onErrorCallback,
      );
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return alertDialogContent();
          },
        );
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onSuccessCallback(syncStatus) {
    showSnackBar('Sync successful');
  }

  _onErrorCallback(syncStatus) {
    showSnackBar('Sync not successful', isError: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                'Welcome $activeAtSign!',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                AtSyncUIService().sync();
              },
              child: const Text('Default Sync'),
            ),
            ElevatedButton(
              onPressed: () async {
                AtSyncUIService().sync(
                  atSyncUIOverlay: AtSyncUIOverlay.dialog,
                );
              },
              child: const Text('Sync with dialog overlay'),
            ),
            ElevatedButton(
              onPressed: () async {
                AtSyncUIService().sync(
                  atSyncUIOverlay: AtSyncUIOverlay.snackbar,
                );
              },
              child: const Text('Sync with snackbar'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UIOptions()));
              },
              child: const Text('See all UI options'),
            ),
          ],
        ),
      ),
    );
  }

  Widget alertDialogContent() {
    return AlertDialog(
      title: const Text('you are not authenticated.'),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: const Text(
            'Ok',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  void showSnackBar(String msg, {bool isError = false}) {
    ScaffoldMessenger.of(NavService.navKey.currentContext!).showSnackBar(SnackBar(
      backgroundColor: isError ? const Color(0xFFe34040) : Colors.green,
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 0.1, fontWeight: FontWeight.normal),
      ),
    ));
  }
}
