

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:instant_messaging/src/cancel_account.dart';
import 'package:instant_messaging/src/provider/theme.dart';
import 'config.dart';
import 'package:provider/provider.dart';
import 'contactPage.dart';
//import 'pages/privacy/privacy_webview.dart';

class About extends StatefulWidget{

  const About({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AboutState();


}

class AboutState extends State<About>{
  final V2TIMManager sdkInstance = TIMUIKitCore.getSDKInstance();
  String sdkVersion = "null";

  Widget aboutItem(String text, Function onClick, [String? rightText]){
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color:
            Color(int.parse('ededed', radix: 16)).withAlpha(255),
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: TIMUIKitOperationItem(
          isEmpty: text.isEmpty,
          operationName: TIM_t(text),
          showAllowEditStatus: !(rightText != null && rightText.isNotEmpty),
          operationRightWidget: Text(rightText ?? "", textAlign: TextAlign.end),
        ),
      ),
    );
  }

  void getSDKVersion() async {
    final versionValue = await sdkInstance.getVersion();
    setState(() {
      sdkVersion = versionValue.data ?? "null";
    });
  }

  @override
  void initState() {
    getSDKVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<DefaultThemeData>(context).theme;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        shadowColor: theme.weakDividerColor,
        elevation: 1,
        title: Text(
            TIM_t("关于 · IM"),
          style: const TextStyle(fontSize: IMDemoConfig.appBarTitleFontSize),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              theme.lightPrimaryColor ?? CommonColor.lightPrimaryColor,
              theme.primaryColor ?? CommonColor.primaryColor
            ]),
          ),
        ),
      ),
      body: Column(
        children: [
          aboutItem( "SDK版本号", (){}, sdkVersion),
          aboutItem( "应用版本号", (){}, IMDemoConfig.appVersion),
          const SizedBox(
            height: 12,
          ),          
          const SizedBox(
            height: 12,
          ),
          aboutItem( "注销账户", (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  CancelAccount(),
              ),
            );
          }),
          aboutItem( "联系我们", (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactPage(),
              ),
            );
          }),
        ],
      ),
    );
  }
}