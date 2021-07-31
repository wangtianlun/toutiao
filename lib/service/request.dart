import 'dart:convert';
import 'package:dio/dio.dart';

class Request {
  static BaseOptions _options = BaseOptions(
    baseUrl: '',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  static Dio _dio = Dio(_options);

  static Future<T> request<T>(String path,
      {String? method, Map? params, data}) async {
    try {
      Response response = await _dio.request(path,
          data: data, options: Options(method: method));
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['status'] != 200) {
          return Future.error(response.data['msg']);
        } else {
          if (response.data is Map) {
            return response.data;
          } else {
            return json.decode(response.data.toString());
          }
        }
      } else {
        _handleHttpError(response.statusCode);
        return Future.error('HTTP错误');
      }
    } on DioError catch (e) {
      return Future.error(_dioError(e));
    } catch (e) {
      return Future.error('未知异常');
    } finally {}
    return Future.error('未知异常');
  }

  static String _dioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return "网络连接超时，请检查网络设置";
      case DioErrorType.receiveTimeout:
        return "服务器异常，请稍后重试！";
      case DioErrorType.sendTimeout:
        return "网络连接超时，请检查网络设置";
      case DioErrorType.response:
        return "服务器异常，请稍后重试！";
      case DioErrorType.cancel:
        return "请求已被取消，请重新请求";
      case DioErrorType.other:
        return "网络异常，请稍后重试！";
      default:
        return 'Dio异常';
    }
  }

  static void _handleHttpError(int? errorCode) {
    String message;
    switch (errorCode) {
      case 400:
        message = '请求语法错误';
        break;
      case 401:
        message = '未授权，请登录';
        break;
      case 403:
        message = '拒绝访问';
        break;
      case 404:
        message = '请求出错';
        break;
      case 408:
        message = '请求超时';
        break;
      case 500:
        message = '服务器异常';
        break;
      case 501:
        message = '服务未实现';
        break;
      case 502:
        message = '网关错误';
        break;
      case 503:
        message = '服务不可用';
        break;
      case 504:
        message = '网关超时';
        break;
      case 505:
        message = 'HTTP版本不受支持';
        break;
      default:
        message = '请求失败，错误码：$errorCode';
    }

    print(message);
  }

  static Future<T> get<T>(String path, {Map? params}) {
    return request(path, method: 'GET', params: params);
  }

  static Future<T> post<T>(String path, {Map? params, data}) {
    return request(path, method: 'post', params: params, data: data);
  }
}
