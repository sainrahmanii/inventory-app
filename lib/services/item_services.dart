import 'package:http/http.dart' as http;
import 'package:inventory_app/models/response_item.dart';
import 'package:inventory_app/services/auth_services.dart';

class ItemServices {
  Future<ResponseItem> getItems() async {
    final response = await http.get(Uri.parse('${baseUrl}getBarang'));
    if (response.statusCode == 200) {
      return responseItemFromJson(response.body);
    } else {
      throw Exception('Failed to get items');
    }
  }

  Future<ResponseItem> insertItem(
      String name, String amount, String imageUrl) async {
    final response =
        await http.post(Uri.parse('${baseUrl}insertBarang'), body: {
      'nama': name,
      'jumlah': amount,
      'gambar': imageUrl,
    });

    if (response.statusCode == 200) {
      return responseItemFromJson(response.body);
    } else {
      throw Exception('Failed to insert item');
    }
  }

  Future<ResponseItem> updateItem(
      String id, String name, String amount, String imageUrl) async {
    final response =
        await http.post(Uri.parse('${baseUrl}updateBarang'), body: {
      'id': id,
      'nama': name,
      'jumlah': amount,
      'gambar': imageUrl,
    });

    if (response.statusCode == 200) {
      return responseItemFromJson(response.body);
    } else {
      throw Exception('Failed to update item');
    }
  }

  Future<ResponseItem> deleteItem(String id) async {
    final response =
        await http.post(Uri.parse('${baseUrl}deleteBarang'), body: {
      'id': id,
    });

    if (response.statusCode == 200) {
      return responseItemFromJson(response.body);
    } else {
      throw Exception('Failed to delete item');
    }
  }
}
