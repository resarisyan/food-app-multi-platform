import 'package:food_app/src/model/KategoriModel.dart';
import 'package:food_app/src/provider/KategoriProvider.dart';

class KategoriRepo {
  final _provider = KategoriProvider();

  Future<List<KategoriModel>> getKategori() {
    return _provider.getKategori();
  }
}
