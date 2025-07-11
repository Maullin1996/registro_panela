import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registro_panela/features/stage1_delivery/domin/stage1_form_data.dart';

final stage1ProjectsMockProvider = Provider<List<Stage1FormData>>((ref) {
  return [
    Stage1FormData(
      id: '1',
      name: 'La Esperanza',
      gaveras: [
        GaveraData(quantity: 8, referenceWeight: 950),
        GaveraData(quantity: 6, referenceWeight: 970),
      ],
      basketsQuantity: 15,
      preservativesWeight: 2.5,
      preservativesJars: 5,
      limeWeight: 1.2,
      limeJars: 3,
      phone: '3201234567',
      date: DateTime(2024, 7, 10),
      photoPath: null,
    ),
    Stage1FormData(
      id: '2',
      name: 'Don Carlos',
      gaveras: [
        GaveraData(quantity: 8, referenceWeight: 500),
        GaveraData(quantity: 6, referenceWeight: 850),
      ],
      basketsQuantity: 120,
      preservativesWeight: 1.0,
      preservativesJars: 1,
      limeWeight: 1,
      limeJars: 1,
      phone: '3113669344',
      date: DateTime(2024, 7, 11),
      photoPath: null,
    ),
  ];
});
