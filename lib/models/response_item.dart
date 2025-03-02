// To parse this JSON data, do
//
//     final responseItem = responseItemFromJson(jsonString);

import 'dart:convert';

ResponseItem responseItemFromJson(String str) =>
    ResponseItem.fromJson(json.decode(str));

class ResponseItem {
  final String pesan;
  final bool sukses;
  final List<Barang>? barang;
  final int? lastId;

  ResponseItem({
    required this.pesan,
    required this.sukses,
    required this.barang,
    required this.lastId,
  });

  factory ResponseItem.fromJson(Map<String, dynamic> json) => ResponseItem(
        pesan: json["pesan"],
        sukses: json["sukses"],
        barang: json['barang'] == null
            ? null
            : List<Barang>.from(json["barang"].map((x) => Barang.fromJson(x))),
        lastId: json['last_id'],
      );
}

class Barang {
  final String barangId;
  final String barangNama;
  final String barangJumlah;
  final String barangGambar;

  Barang({
    required this.barangId,
    required this.barangNama,
    required this.barangJumlah,
    required this.barangGambar,
  });

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        barangId: json["barang_id"],
        barangNama: json["barang_nama"],
        barangJumlah: json["barang_jumlah"],
        barangGambar: json["barang_gambar"],
      );
}
