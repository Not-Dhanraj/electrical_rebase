import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParallelRestData extends Notifier<String?> {
  @override
  String build() {
    return '0';
  }

  double _calculateParallel(List<double> resistances) {
    return 1 /
        resistances.map((e) => 1 / e).fold(0, (prev, curr) => prev + curr);
  }

  void calulate(List<double> resistances) {
    state = _calculateParallel(resistances).toStringAsFixed(3);
  }
}

final parallelRestDataProvider =
    NotifierProvider<ParallelRestData, String?>(ParallelRestData.new);
