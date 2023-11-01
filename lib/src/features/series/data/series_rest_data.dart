import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeriesRestData extends Notifier<String?> {
  @override
  String build() {
    return '0';
  }

  double _calculateSeries(List<double> resistances) {
    return resistances.fold(0, (prev, curr) => prev + curr);
  }

  void calulate(List<double> resistances) {
    state = _calculateSeries(resistances).toStringAsFixed(3);
  }
}

final seriesRestDataProvider =
    NotifierProvider<SeriesRestData, String?>(SeriesRestData.new);
