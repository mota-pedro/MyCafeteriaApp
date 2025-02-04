import '../entities/CafeteriaTable.dart';

class TableManager {
  static final TableManager _instance = TableManager._internal();

  factory TableManager() {
    return _instance;
  }

  TableManager._internal();

  final List<CafeteriaTable> tableList = [
    CafeteriaTable(number: 1),
    CafeteriaTable(number: 2),
    CafeteriaTable(number: 3),
    CafeteriaTable(number: 4),
    CafeteriaTable(number: 5),
    CafeteriaTable(number: 6),
    CafeteriaTable(number: 7),
    CafeteriaTable(number: 8),
    CafeteriaTable(number: 9),
    CafeteriaTable(number: 10)
  ];

  List<CafeteriaTable> getTables() => tableList;
}
