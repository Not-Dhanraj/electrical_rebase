import 'package:electrical_project/src/features/delta_star/domain/delta_star.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeltaToStar extends Notifier<DeltaToStarModel> {
  @override
  DeltaToStarModel build() {
    return DeltaToStarModel(raS: '0', rbS: '0', rcS: '0');
  }

  void deltaToStar(double r1, double r2, double r3) {
    double sum = r1 + r2 + r3;
    var ra = (r1 * r2) / sum;
    var rb = (r1 * r3) / sum;
    var rc = (r3 * r2) / sum;

    state = DeltaToStarModel(
        raS: ra.toStringAsFixed(3),
        rbS: rb.toStringAsFixed(3),
        rcS: rc.toStringAsFixed(3));
  }
}

final deltaToStarProvider =
    NotifierProvider<DeltaToStar, DeltaToStarModel>(DeltaToStar.new);
