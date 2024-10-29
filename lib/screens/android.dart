import 'package:flutter/material.dart';

import '../main.dart';
import 'component/add_user.dart';
import 'component/callList_page.dart';
import 'component/chat.dart';
import 'component/setting_page.dart';

class AndroidUi extends StatelessWidget {
  const AndroidUi({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PlatForm Converter'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Switch(
                value: converter.isIos.value,
                onChanged: (value) {
                  converter.changePlatform();
                },
              ),
            ),
          ],
          bottom: const TabBar(
            tabAlignment: TabAlignment.fill,
            indicatorPadding: EdgeInsets.zero,
            tabs: [
              Tab(
                child: Icon(Icons.account_circle),
              ),
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'CALLS',
              ),
              Tab(
                text: 'SETTINGS',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AddUser(),
            ChatPage(),
            CalllistPage(),
            SettingsPage()
          ],
        ),
      ),
    );
  }
}