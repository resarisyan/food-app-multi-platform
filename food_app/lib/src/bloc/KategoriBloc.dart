import 'package:food_app/src/model/KategoriModel.dart';
import 'package:food_app/src/repository/KategoriRepo.dart';
import 'package:rxdart/rxdart.dart';

class KategoriBloc {
  final _kategoriRepo = KategoriRepo();

  final getAllKategori = PublishSubject<List<KategoriModel>>();
  Stream<List<KategoriModel>> get countKategori => getAllKategori.stream;

  getKategori() async {
    List<KategoriModel> kategori = await _kategoriRepo.getKategori();
    getAllKategori.sink.add(kategori);
  }

  dispose() async {
    await getAllKategori.drain();
    getAllKategori.close();
  }
}

final kategoriBloc = KategoriBloc();
