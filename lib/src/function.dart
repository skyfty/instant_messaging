import 'package:flutter/material.dart';

class AppHomePage extends StatelessWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _buildAppBar(),
            const SizedBox(height: 8.0),
            _buildQuickEntry(),
            const SizedBox(height: 8.0),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: const Icon(Icons.menu, color: Colors.black),
      title: const Text("支付宝", style: TextStyle(color: Colors.black)),
      // ignore: prefer_const_literals_to_create_immutables
      actions: <Widget>[
        const Icon(Icons.search, color: Colors.black),
        const SizedBox(width: 16.0),
        const Icon(Icons.arrow_forward, color: Colors.black),
        const SizedBox(width: 16.0),
      ],
    );
  }

  Widget _buildQuickEntry() {
    return Container(
      color: Colors.grey.shade200,
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        children: <Widget>[
          _buildQuickEntryItem(Icons.add_box, "转账"),
          _buildQuickEntryItem(Icons.credit_card, "信用卡还款"),
          _buildQuickEntryItem(Icons.attach_money, "余额宝"),
          _buildQuickEntryItem(Icons.crop_square, "手机充值"),
          _buildQuickEntryItem(Icons.view_carousel, "理财"),
          _buildQuickEntryItem(Icons.local_phone, "淘宝"),
          _buildQuickEntryItem(Icons.favorite_border, "爱心捐赠"),
          _buildQuickEntryItem(Icons.more_horiz, "更多"),
        ],
      ),
    );
  }

  Widget _buildQuickEntryItem(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon),
        const SizedBox(height: 8.0),
        Text(text, style: TextStyle(fontSize: 12.0)),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
         // _buildBanner(),
          const SizedBox(height: 8.0),
          _buildNews(),
          const SizedBox(height: 8.0),
          _buildService(),
          const SizedBox(height: 8.0),
          _buildBill(),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  // Widget _buildBanner() {
  //   return Container(
  //     height: 150.0,
  //     child: Stack(
  //       children: <Widget>[
  //         Positioned.fill(
  //           child: Image.network(
  //             "https://img.alicdn.com/imgextra/i3/6000000000383/O1CN01xYpKoJ1MgqJrXDZ46_!!6000000000383-0-juitemmedia.jpg_430x430q90.jpg",
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //         const Positioned(
  //           left: 16.0,
  //           bottom: 16.0,
  //           child: SizedBox(
  //             width: 120.0,
  //             child: Text(
  //               "支付宝",
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 24.0,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildNews() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("新闻", style: TextStyle(fontSize: 16.0)),
                Icon(Icons.arrow_forward_ios, size: 16.0),
              ],
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 60.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildNewsItem("宝剑锋从磨砺出 梅花香自苦寒来"),
                  SizedBox(width: 16.0),
                  _buildNewsItem("人生自古谁无背？留取丹心照汗青"),
                  SizedBox(width: 16.0),
                  _buildNewsItem("世上无难事，只怕有心人"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsItem(String text) {
    return Container(
      width: 120.0,
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: 12.0, color: Colors.grey),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildService() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Text("服务", style: TextStyle(fontSize: 16.0)),
                Icon(Icons.arrow_forward_ios, size: 16.0),
              ],
            ),
            const SizedBox(height: 8.0),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: <Widget>[
                _buildServiceItem(Icons.directions_car, "车主服务"),
                _buildServiceItem(Icons.local_offer, "优惠券"),
                _buildServiceItem(Icons.wifi_tethering, "免费领流量"),
                _buildServiceItem(Icons.movie, "影票"),
                _buildServiceItem(Icons.flight, "机票火车票"),
                _buildServiceItem(Icons.cloud_circle, "我的快递"),
                _buildServiceItem(Icons.local_dining, "美食餐饮"),
                _buildServiceItem(Icons.more_horiz, "更多"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon),
        const SizedBox(height: 8.0),
        Text(text, style: const TextStyle(fontSize: 12.0)),
      ],
    );
  }

  Widget _buildBill() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Text("账单", style: TextStyle(fontSize: 16.0)),
                Icon(Icons.arrow_forward_ios, size: 16.0),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Text("我的卡", style: TextStyle(fontSize: 12.0)),
                    SizedBox(height: 4.0),
                    Text("**** **** **** 0987",
                        style: TextStyle(fontSize: 16.0)),
                    SizedBox(height: 4.0),
                    Text("2.3万",
                        style: TextStyle(fontSize: 12.0, color: Colors.green)),
                  ],
                ),
                Container(
                  width: 100.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade200,
                  ),
                  child: const Center(
                    child: Text("立即还款", style: TextStyle(fontSize: 14.0)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
