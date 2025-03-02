import 'package:flutter/material.dart';
import 'package:inventory_app/models/response_item.dart';
import 'package:inventory_app/services/item_services.dart';

class FormProviders extends ChangeNotifier {
  final Barang? barang;
  FormProviders(this.barang) {
    print('FormProviders disposed');
    nameController = TextEditingController(text: barang?.barangNama ?? '');
    amountController = TextEditingController(text: barang?.barangJumlah ?? '');
    imageUrlController =
        TextEditingController(text: barang?.barangGambar ?? '');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('FormProvider disposed');
    super.dispose();
    nameController.dispose();
    amountController.dispose();
    imageUrlController.dispose();
  }

  bool get isUpdateForm => barang != null;
  final ItemServices _itemServices = ItemServices();
  final formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController amountController;
  late TextEditingController imageUrlController;

  late ResponseItem responseItem;

  Future insert() async {
    final result = await _itemServices.insertItem(
      nameController.text,
      amountController.text,
      imageUrlController.text,
    );
    responseItem = result;
    print(responseItem.sukses);
  }

  Future update() async {
    final result = await _itemServices.updateItem(
      barang!.barangId,
      nameController.text,
      amountController.text,
      imageUrlController.text,
    );
    responseItem = result;
    print(responseItem.sukses);
  }

  Future delete() async {
    final result = await _itemServices.deleteItem(barang!.barangId);
    responseItem = result;
    print(responseItem.sukses);
  }

  Future submit() async {
    if (formKey.currentState!.validate()) {
      if (isUpdateForm) {
        update();
      } else {
        insert();
      }
      return true;
    } else {
      return false;
    }
  }
}
