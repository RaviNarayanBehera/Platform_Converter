import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Modal/user_modal.dart';
import '../../main.dart';
import 'add_user.dart';

class CalllistPage extends StatelessWidget {
  const CalllistPage({super.key});

  @override
  Widget build(BuildContext context) {
    if(converter.isIos.value)
    {
      return FutureBuilder(future: platform.readDataFromDatabase(), builder: (context, snapshot) {
        List<PlatformModal> userData = platform.userData
            .map(
              (e) => PlatformModal.fromMap(e),
        )
            .toList();
        return ListView.builder(
          itemCount: userData.length,
          itemBuilder: (context, index) {
            String profilePath = userData[index].profile;

            ImageProvider profileImage;

            if (profilePath.startsWith('http')) {
              profileImage = NetworkImage(profilePath);
            }

            else if (File(profilePath).existsSync()) {
              profileImage = FileImage(File(profilePath));
            }
            else {
              profileImage = const AssetImage('assets/images/p.jpg');
            }
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: CupertinoColors.systemGrey4, width: 0.5),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 24,
                      backgroundImage: profileImage
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userData[index].name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          userData[index].chatConversation,
                          style: const TextStyle(
                            fontSize: 16,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    CupertinoIcons.phone,
                    color: CupertinoColors.systemBlue,
                  ),
                ],
              ),
            );
          },
        );
      },);
    }
    else
    {
      return FutureBuilder(future: platform.readDataFromDatabase(), builder: (context, snapshot) {
        List<PlatformModal> userData = platform.userData
            .map(
              (e) => PlatformModal.fromMap(e),
        )
            .toList();
        return ListView.builder(
          itemCount: userData.length,
          itemBuilder: (context, index) {
            String profilePath = userData[index].profile;

            ImageProvider profileImage;

            if (profilePath.startsWith('http')) {
              profileImage = NetworkImage(profilePath);
            }

            else if (File(profilePath).existsSync()) {
              profileImage = FileImage(File(profilePath));
            }
            else {
              profileImage = const AssetImage('assets/images/p.jpg');
            }


            return ListTile(
              leading: CircleAvatar(
                backgroundImage: profileImage,

              ),
              title: Text(userData[index].name),
              subtitle: Text(userData[index].chatConversation),
              trailing: const Icon(Icons.call),
            );
          },
        );
      },);

    }
  }
}