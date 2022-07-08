import 'package:food_app/src/model/KategoriModel.dart';
import 'package:food_app/src/utility/BaseURL.dart';
import 'package:http/http.dart' show Client;
import 'package:flutter/foundation.dart' show compute;

class KategoriProvider {
  Client _client = Client();

  Future<List<KategoriModel>> getKategori() async {
    var uri = Uri.parse(BaseURL.urlGetKategori);

    final res = await _client.get(uri, headers: {
      'Accept': 'application/json',
    });

    print('Status Code: ${res.body}');

    if (res.statusCode == 200) {
      return compute(kategoriFromJson, res.body);
    } else {
      return [];
    }
  }
}
