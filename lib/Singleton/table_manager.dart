import '../entities/CafeteriaTable.dart';

class TableManager {
  static final TableManager _instance = TableManager._internal();

  factory TableManager() {
    return _instance;
  }

  TableManager._internal();

  final List<CafeteriaTable> tableList = [
    CafeteriaTable(number: 01),
    CafeteriaTable(number: 02),
    CafeteriaTable(number: 03)
  ];

  List<CafeteriaTable> getTables() => tableList;
}
