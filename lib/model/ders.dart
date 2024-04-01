class Ders{
  final String dersAdi;
  final double harfDegeri;
  final double kredi;

  Ders({required this.dersAdi, required this.harfDegeri, required this.kredi});

  @override
  String toString() {
    // TODO: implement toString
    return "$dersAdi, $harfDegeri, $kredi";
  }

}