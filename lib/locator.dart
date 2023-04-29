import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lettutor_app/data/datasources/remote/authentication_service.dart';
import 'package:lettutor_app/data/datasources/remote/course_service.dart';
import 'package:lettutor_app/data/datasources/remote/tutor_service.dart';

import 'data/repositories/api_repository_impl.dart';
import 'domain/repositories/api_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {

  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<AuthenticationService>(
    AuthenticationService(locator<Dio>()),
  );


  locator.registerSingleton<TutorService>(
    TutorService(locator<Dio>()),
  );

  locator.registerSingleton<CourseService>(
    CourseService(locator<Dio>()),
  );


  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<AuthenticationService>(), locator<TutorService>(), locator<CourseService>()),
  );
}
