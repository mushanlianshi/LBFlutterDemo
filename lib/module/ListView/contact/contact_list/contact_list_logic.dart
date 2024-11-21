import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'contact_list_state.dart';

class ContactListLogic extends GetxController {

  final RxList<ContactUser> contractList = <ContactUser>[].obs;
  final List<ContactUser> _originalList = [
  const ContactUser('Jack', Colors.amber),
  const ContactUser('Lucy', Colors.green),
  const ContactUser('Luna', Colors.black26),
  const ContactUser('Oliver', Colors.blue),
  const ContactUser('Lily', Colors.amberAccent),
  const ContactUser('Milo', Colors.purple),
  const ContactUser('Max', Colors.pink),
  const ContactUser('Kitty', Colors.yellowAccent),
  const ContactUser('Simba', Colors.red),
  const ContactUser('Zoe', Colors.blueAccent),
  const ContactUser('Jasper', Colors.deepOrange),
  const ContactUser('Stella', Colors.cyan),
  const ContactUser('Lola', Colors.lightBlue),
  const ContactUser('Halsey', Colors.deepPurpleAccent),
  const ContactUser('Taylor', Colors.indigoAccent),
  ];

  @override
  void onReady() {
    super.onReady();
    contractList.addAll(_originalList);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  siftContact(String prefix){
     debugPrint("LBLog sift text is ${prefix}");
     if (prefix.length > 0){
       contractList.value = _originalList.where((element){
            return element.name.toLowerCase().contains(prefix.toLowerCase());
        }).toList();
     }else{
          contractList.value = _originalList;
     }
  }
}















