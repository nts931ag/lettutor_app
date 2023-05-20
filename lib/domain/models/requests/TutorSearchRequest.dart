import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/requests/Filter.dart';
import 'package:lettutor_app/utils/constant/nums.dart';

class TutorSearchRequest extends Equatable {
  Filter? filters;
  final String search;
  final int page;
  final int perPage;

  TutorSearchRequest({
    this.search = '',
    this.page = 1,
    this.perPage = defaultPageSize,
  });



  @override
  List<Object?> get props => [filters, search, page, perPage];

  Map<String, dynamic> toMap() {
    return {
      'filters': this.filters,
      'search': this.search,
      'page': this.page,
      'perPage': this.perPage,
    };
  }

}
