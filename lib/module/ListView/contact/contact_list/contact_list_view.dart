import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/WidgetExtension/BLTWidgetExtensions.dart';

import 'contact_list_logic.dart';
import 'contact_list_state.dart';

class ContactListPage extends StatelessWidget {
  ContactListPage({Key? key}) : super(key: key);
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ContactListLogic logic = Get.put(ContactListLogic());
    return CupertinoTabView(
      builder: (context) {
        return CustomScrollView(
          slivers: <Widget>[
            _buildNavigationBar(),
            _buildSearchWidget(),
            _buildContactList(),
          ],
        );
      },
    ).intoContainer(color: Colors.white, padding: EdgeInsets.only(left: 10));
  }

  Widget _buildNavigationBar() {
    return CupertinoSliverNavigationBar(
      largeTitle: Text('Chats'),
      leading: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text("back", style: TextStyle(color: CupertinoColors.link)),
      ),
      middle: Row(
        mainAxisSize: MainAxisSize.max,
        children: const [
          CupertinoActivityIndicator(),
          SizedBox(width: 8),
          Text('wait for networking'),
        ],
      ),
    );
  }

  Widget _buildSearchWidget() {
    final logic = Get.find<ContactListLogic>();
    return SliverToBoxAdapter(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: ClipRect(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: CupertinoSearchTextField(
              controller: _editingController,
              onChanged: (text) {
                logic.siftContact(text);
              },
              onSubmitted: (text) {
                logic.siftContact(text);
              },
              onSuffixTap: () {
                _editingController.text = "";
                logic.siftContact('');
              },
            ),
          ),
        ),
      ).intoContainer(color: Colors.white),
    );
  }

  Widget _buildContactList() {
    final logic = Get.find<ContactListLogic>();
    return Obx(() {
      return SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            ContactUser user = logic.contractList[index];
            return _buildListItemWidget(user);
          }, childCount: logic.contractList.length),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 5,
          ));
    });
  }

  Widget _buildListItemWidget(ContactUser user) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: user.color,
          ),
        ),
        SizedBox(width: 10),
        Text(user.name, style: TextStyle(fontSize: 16, color: Colors.black)),
      ],
    ).intoContainer(color: Colors.white);
  }
}
