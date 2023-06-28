//联系人和个人资料
import 'package:flutter/material.dart';
import 'package:instant_messaging/src/contact.dart';
import 'package:instant_messaging/src/group_list.dart';
import 'package:instant_messaging/src/multi_platform_widget/search_entry/search_entry.dart';
import 'package:instant_messaging/src/multi_platform_widget/search_entry/search_entry_wide.dart';
import 'package:instant_messaging/src/pages/cross_platform/wide_screen/empty_widget.dart';
import 'package:instant_messaging/src/provider/theme.dart';
import 'package:instant_messaging/src/search.dart';
import 'package:instant_messaging/src/user_profile.dart';
import 'package:tencent_cloud_chat_uikit/data_services/core/tim_uikit_wide_modal_operation_key.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/controller/tim_uikit_conversation_controller.dart';
import 'package:provider/provider.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/platform.dart';
import 'package:tencent_cloud_chat_uikit/ui/widgets/wide_popup.dart';


class ContactsAndProfile extends StatefulWidget {
  final ValueChanged<V2TimConversation> onNavigateToChat;

  const ContactsAndProfile({Key? key, required this.onNavigateToChat})
      : super(key: key);

  @override
  State<ContactsAndProfile> createState() => _ContactsAndProfileState();
}

class _ContactsAndProfileState extends State<ContactsAndProfile> {
  final TIMUIKitConversationController _conversationController =
      TIMUIKitConversationController();

  bool isShowSearch = false;
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<DefaultThemeData>(context).theme;
    return Row(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 280,
          ),
          child: isShowSearch
              ? Search(
                  onTapConversation: (conversation, message) {
                    widget.onNavigateToChat(conversation);
                    setState(() {
                      isShowSearch = false;
                    });
                  },
                  isAutoFocus: true,
                  onBack: () {
                    setState(() {
                      isShowSearch = false;
                    });
                  },
                )
              : DefaultTabController(
                  length: 2,
                  child: Container(
                    color: theme.wideBackgroundColor,
                    child: Column(
                      children: [
                        SearchEntry(
                          conversationController: _conversationController,
                          plusType: PlusType.add,
                          directToChat: widget.onNavigateToChat,
                          onClickSearch: () {
                            if (PlatformUtils().isWeb) {
                              TUIKitWidePopup.showPopupWindow(
                                  operationKey:
                                      TUIKitWideModalOperationKey.contactUs,
                                  context: context,
                                  theme: theme,
                                  title: TIM_t("暂不支持"),
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: (closeFunc) => Center(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(TIM_t(
                                                  "Web 端暂不支持本地搜索，请使用 Mobile App 或 Desktop 端体验")),
                                            
                                            ],
                                          ),
                                        ),
                                      ));
                            } else {
                              setState(() {
                                isShowSearch = true;
                              });
                            }
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          child: TabBar(
                            isScrollable: true,
                            labelColor: theme.primaryColor,
                            labelStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            unselectedLabelColor: hexToColor("62626b"),
                            unselectedLabelStyle:
                                const TextStyle(fontWeight: FontWeight.normal),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor:
                                theme.primaryColor ?? hexToColor("62626b"),
                            tabs: [
                              Container(
                                child: Text(TIM_t("联系人")),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                margin: const EdgeInsets.only(bottom: 6),
                              ),
                              Container(
                                child: Text(TIM_t("群组")),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                margin: const EdgeInsets.only(bottom: 6),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: TabBarView(
                          children: [
                            Contact(
                              onTapItem: (userID) {
                                setState(() {
                                  selectedItem = userID;
                                });
                              },
                            ),
                            GroupList(onTapItem: (V2TimGroupInfo groupInfo,
                                V2TimConversation conversation) {
                              widget.onNavigateToChat(conversation);
                            }),
                          ],
                        ))
                      ],
                    ),
                  )),
        ),
        SizedBox(
          width: 1,
          child: Container(
            color: theme.weakDividerColor,
          ),
        ),
        if (selectedItem == null || selectedItem!.isEmpty)
          Expanded(
              child: EmptyWidget(
            title: TIM_t("联系人 & 群组"),
            description: TIM_t("请选择联系人或群组，以查看详情"),
          )),
        if (selectedItem != null &&
            selectedItem!.isNotEmpty &&
            !selectedItem!.startsWith("group_"))
          Expanded(
              child: UserProfile(
            userID: selectedItem!,
            onClickSendMessage: (V2TimConversation conversation) {
              widget.onNavigateToChat(conversation);
            },
          ))
      ],
    );
  }
}
