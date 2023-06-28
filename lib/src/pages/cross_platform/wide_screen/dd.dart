import 'package:flutter/material.dart';
import 'package:instant_messaging/src/function.dart';

import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:instant_messaging/src/provider/login_user_Info.dart';
import 'package:instant_messaging/src/provider/theme.dart';
import 'package:provider/provider.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/screen_utils.dart';

// ignore: camel_case_types
class Ddd extends StatefulWidget {
  final ValueChanged<V2TimConversation> onNavigateToChat;

  const Ddd({Key? key, required this.onNavigateToChat}) : super(key: key);

  @override
  State<Ddd> createState() => _DddState();
}

// ignore: camel_case_types
class _DddState extends State<Ddd> {
  final TIMUIKitProfileController _timuiKitProfileController =
      TIMUIKitProfileController();

  Widget? mainPage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginUserInfoModel = Provider.of<LoginUserInfo>(context);
    final V2TimUserFullInfo loginUserInfo = loginUserInfoModel.loginUserInfo;
    final isWideScreen =
        TUIKitScreenUtils.getFormFactor(context) == DeviceType.Desktop;
    final theme = Provider.of<DefaultThemeData>(context).theme;

    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 60,
          ),
          child: MoveWindow(
            child: Container(
              color: isWideScreen ? theme.wideBackgroundColor : null,
            ),
          ),
        ),
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: Container(
              color: isWideScreen ? theme.wideBackgroundColor : null,
              padding: isWideScreen
                  ? const EdgeInsets.symmetric(horizontal: 80)
                  : null,
              child: TIMUIKitProfile(
                userID: loginUserInfo.userID ?? "",
                controller: _timuiKitProfileController,
                builder: (BuildContext context,
                    V2TimFriendInfo userInfo,
                    V2TimConversation conversation,
                    int friendType,
                    bool isMute) {
                  return const AppHomePage();
                },
              ),
            )),
          ],
        )),
      ],
    );
  }
}
