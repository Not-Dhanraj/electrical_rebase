import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageOffset extends Notifier<double?> {
  @override
  double build() {
    return 2;
  }

  void changePageOffset(double? offset) {
    state = offset;
    // print('offset$offset');
  }
}

final pageOffsetProvider =
    NotifierProvider<PageOffset, double?>(PageOffset.new);
