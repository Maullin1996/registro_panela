import '../../domain/entities/stage1_form_data.dart';

class Stage1FormModel {
  final String id;
  final String name;
  final List<Map<String, dynamic>> gaveras;
  final int basketsQuantity;
  final double preservativesWeight;
  final int preservativesJars;
  final double limeWeight;
  final int limeJars;
  final String phone;
  final DateTime date;
  final String? photoPath;

  Stage1FormModel({
    required this.id,
    required this.name,
    required this.gaveras,
    required this.basketsQuantity,
    required this.preservativesWeight,
    required this.preservativesJars,
    required this.limeWeight,
    required this.limeJars,
    required this.phone,
    required this.date,
    this.photoPath,
  });

  factory Stage1FormModel.fromEntity(Stage1FormData data) {
    return Stage1FormModel(
      id: data.id,
      name: data.name,
      gaveras: data.gaveras
          .map(
            (g) => {
              'quantity': g.quantity,
              'referenceWeight': g.referenceWeight,
            },
          )
          .toList(),
      basketsQuantity: data.basketsQuantity,
      preservativesWeight: data.preservativesWeight,
      preservativesJars: data.preservativesJars,
      limeWeight: data.limeWeight,
      limeJars: data.limeJars,
      phone: data.phone,
      date: data.date,
      photoPath: data.photoPath,
    );
  }

  Stage1FormData toEntity() {
    return Stage1FormData(
      id: id,
      name: name,
      gaveras: gaveras
          .map(
            (g) => GaveraData(
              quantity: g['quantity'],
              referenceWeight: g['referenceWeight'],
            ),
          )
          .toList(),
      basketsQuantity: basketsQuantity,
      preservativesWeight: preservativesWeight,
      preservativesJars: preservativesJars,
      limeWeight: limeWeight,
      limeJars: limeJars,
      phone: phone,
      date: date,
      photoPath: photoPath,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gaveras': gaveras,
      'basketsQuantity': basketsQuantity,
      'preservativesWeight': preservativesWeight,
      'preservativesJars': preservativesJars,
      'limeWeight': limeWeight,
      'limeJars': limeJars,
      'phone': phone,
      'date': date.toIso8601String(),
      'photoPath': photoPath,
    };
  }

  factory Stage1FormModel.fromJson(Map<String, dynamic> json) {
    return Stage1FormModel(
      id: json['id'],
      name: json['name'],
      gaveras: List<Map<String, dynamic>>.from(json['gaveras']),
      basketsQuantity: json['basketsQuantity'],
      preservativesWeight: json['preservativesWeight'],
      preservativesJars: json['preservativesJars'],
      limeWeight: json['limeWeight'],
      limeJars: json['limeJars'],
      phone: json['phone'],
      date: DateTime.parse(json['date']),
      photoPath: json['photoPath'],
    );
  }
}
