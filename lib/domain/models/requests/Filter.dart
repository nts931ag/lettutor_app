import 'package:equatable/equatable.dart';

class Filter extends Equatable {
  final List<String> specialties;
  final List<String> nationality;

  const Filter({
    this.specialties = const [],
    this.nationality = const [],
  });

  @override
  List<Object> get props => [];
}