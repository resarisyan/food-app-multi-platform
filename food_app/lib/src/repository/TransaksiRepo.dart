import 'package:food_app/src/model/LogPemesanan.dart';
import 'package:food_app/src/model/TransaksiModel.dart';
import 'package:food_app/src/provider/AuthProvider.dart';
import 'package:food_app/src/provider/TransaksiProvider.dart';

class TransaksiRepo {
  final _provider = TransaksiProvider();

  Future getTotalBayar(String id_pelanggan) {
    return _provider.getTotalBayar(id_pelanggan);
  }

  Future kirimPesanan(Map<String, String> data) {
    return _provider.kirimPesanan(data);
  }

  Future<List<TransaksiModel>> getTransaksi(String id_pelanggan) {
    return _provider.getTransaksi(id_pelanggan);
  }

  Future<List<LogPemesananModel>> getItemTransaksi(
      String kd_pemesanan, String id_pelanggan) {
    return _provider.getItemTransaksi(kd_pemesanan, id_pelanggan);
  }
}
