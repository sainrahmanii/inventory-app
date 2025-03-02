import 'package:flutter/material.dart';
import 'package:inventory_app/models/response_item.dart';
import 'package:inventory_app/providers/form_providers.dart';
import 'package:inventory_app/providers/home_provider.dart';
import 'package:inventory_app/ui/widgets/custom_textfield_widgets.dart';
import 'package:provider/provider.dart';

class FormPage extends StatelessWidget {
  final Barang? barang;
  const FormPage({super.key, this.barang});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormProviders(barang),
      builder: (context, _) {
        final providerRead = context.read<FormProviders>();

        Widget nameFields() {
          return CustomTextFieldWidgets(
            controller: providerRead.nameController,
            labelText: "Item Name",
          );
        }

        Widget amountFields() {
          return CustomTextFieldWidgets(
            controller: providerRead.amountController,
            keyboardType: TextInputType.number,
            labelText: "Item Count",
          );
        }

        Widget urlFields() {
          return CustomTextFieldWidgets(
            controller: providerRead.imageUrlController,
            labelText: "URL item",
          );
        }

        Widget buttonSave() {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                final isSuccess = await providerRead.submit();
                if (isSuccess) {
                  context.read<HomeProvider>().getItems();
                  Navigator.pop(context);
                  ScaffoldMessenger(
                    child: SnackBar(
                      content: Text(providerRead.responseItem.pesan),
                    ),
                  );
                } else {
                  ScaffoldMessenger(
                    child: SnackBar(
                      content: Text(providerRead.responseItem.pesan),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'SAVE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text("Page"),
            actions: providerRead.isUpdateForm
                ? [
                    IconButton(
                      onPressed: () async {
                        await providerRead.delete();
                        context.read<HomeProvider>().getItems();
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.delete_rounded,
                        color: Colors.red,
                      ),
                    ),
                  ]
                : [],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: providerRead.formKey,
                child: Column(
                  children: [
                    nameFields(),
                    amountFields(),
                    urlFields(),
                    buttonSave()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
