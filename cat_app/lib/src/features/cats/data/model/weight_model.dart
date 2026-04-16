import 'package:cat_app/src/features/cats/domain/entities/entities.dart';

class WeightModel extends Weight {
  WeightModel({
    required super.imperial,
    required super.metric,
  });

  factory WeightModel.fromJson(Map<String, dynamic> json) {
    return WeightModel(
      imperial: json['imperial'] ?? '',
      metric: json['metric'] ?? '',
    );
  }
}
