import 'package:flutter/material.dart';
import 'package:inventory_app/models/response_item.dart';
import 'package:inventory_app/providers/form_providers.dart';
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
        return Scaffold();
      },
    );
  }
}
