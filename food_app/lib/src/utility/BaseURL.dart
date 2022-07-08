class BaseURL {
  static String domain = "http://192.168.100.113:8090/foodapp/";
  static String baseURL = domain + "api/";
  static String baseURLImg = domain + "public/uploads/img/";

  //Produk
  static String urlGetProduk = baseURL + "produk";
  // Kategori
  static String urlGetKategori = baseURL + "kategori";

  //Auth
  static String urlGetValidateEmail = baseURL + "auth/getValidateEmail";
  static String urlLogin = baseURL + "auth/login";
  static String urlRegister = baseURL + "auth/register";
  static String urlSimpanPassword = baseURL + "auth/simpanPassword";

  //Keranjang
  static String urlGetKeranjang = baseURL + "keranjang";
  static String urlTambahKeranjang = baseURL + "keranjang/tambahKeranjang";
  static String urlUbahQtyKeranjang = baseURL + "keranjang/ubahQtyKeranjang";
  static String urlHapusItemKeranjang =
      baseURL + "keranjang/hapusItemKeranjang";
  static String urlGetTotalItem = baseURL + "keranjang/getTotalItem";

  //Transaksi Pemesanan
  static String urlGetTotalBayar = baseURL + "pemesanan/getTotalBayar";
  static String urlKirimPesanan = baseURL + "pemesanan";
  static String urlGetTransaksi = baseURL + "pemesanan/getTransaksi";
  static String urlGetItemTransaksi = baseURL + "pemesanan/getItemTransaksi";
}
