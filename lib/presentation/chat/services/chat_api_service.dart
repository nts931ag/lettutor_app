import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lettutor_app/presentation/chat/models/chat_model.dart';

class ChatApiService {
  static final chatDio = Dio(BaseOptions(
    // connectTimeout: const Duration(seconds: 60).inSeconds,
    // receiveTimeout: const Duration(seconds: 60).inSeconds,
    responseType: ResponseType.json,
    contentType: ContentType.json.toString(),
  ));

  static Future<ChatModel> sendMessage({required List messages}) async {
    Response response;
    chatDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // Do something before request is sent.
          // If you want to resolve the request with custom data,
          // you can resolve a `Response` using `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject with a `DioError` using `handler.reject(dioError)`.
          options.headers['Authorization'] = 'Bearer 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';
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // Do something with response data.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object using `handler.reject(dioError)`.
          return handler.next(response);
        },
        onError: (DioError e, ErrorInterceptorHandler handler) {
          // Do something with response error.
          // If you want to resolve the request with some custom data,
          // you can resolve a `Response` object using `handler.resolve(response)`.
          return handler.next(e);
        },
      ),
    );
    var data = {"model": "gpt-3.5-turbo", "messages": messages};
    response = await chatDio.post('https://api.openai.com/v1/chat/completions',
        data: data);
    ChatModel chatModel =
        ChatModel.fromJson(response.data['choices'][0]['message']);
    return chatModel;
  }
}
