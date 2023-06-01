import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CardMyPlantModel extends Equatable {
  final String picture;
  final String plantName;
  final String latinName;
  bool isSelected = false;

  CardMyPlantModel({
    required this.picture,
    required this.plantName,
    required this.latinName,
  });

  @override
  List<Object?> get props => [plantName, latinName];
}
