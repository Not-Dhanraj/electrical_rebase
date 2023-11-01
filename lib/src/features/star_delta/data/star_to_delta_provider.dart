import 'package:electrical_project/src/features/star_delta/domain/star_delta.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StarToDelta extends Notifier<StarToDeltaModel> {
  @override
  StarToDeltaModel build() {
    return StarToDeltaModel(r1S: '0', r2S: '0', r3S: '0');
  }

  void starToDelta(double ra, double rb, double rc) {
    double r1 = 0.0;
    double r2 = 0.0;
    double r3 = 0.0;
    double productSum = ra * rb + rb * rc + rc * ra;
    r1 = (productSum) / rc;
    r2 = (productSum) / ra;
    r3 = (productSum) / rb;

    state = StarToDeltaModel(
        r1S: r1.toStringAsFixed(3),
        r2S: r2.toStringAsFixed(3),
        r3S: r3.toStringAsFixed(3));
  }
}

final starToDeltaProvider =
    NotifierProvider<StarToDelta, StarToDeltaModel>(StarToDelta.new);
