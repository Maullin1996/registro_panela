import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registro_panela/features/stage2_load/domin/stage2_load_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stage2_loads_mock_provider.g.dart';

@riverpod
List<Stage2LoadData> stage2LoadsMock(Ref ref) {
  return [
    Stage2LoadData(
      id: 's2-1',
      projectId: '1', // Debe coincidir con algún id de tus proyectos Stage1
      date: DateTime.now().subtract(const Duration(days: 1)),
      baskets: BasketLoadData(referenceWeight: 950, count: 20, realWeight: 600),
    ),
    Stage2LoadData(
      id: 's2-2',
      projectId: '2',
      date: DateTime.now().subtract(const Duration(hours: 5)),
      baskets: BasketLoadData(referenceWeight: 500, count: 5, realWeight: 140),
    ),
    // Puedes agregar más mocks para otros proyectos
  ];
}
