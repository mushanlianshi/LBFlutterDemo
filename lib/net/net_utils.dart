import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lb_flutter_project/module/bean/common_resp.dart';

extension NetUtilsFuture<T> on Future<CommonResp<T>> {
  Future<CommonResp<T>> withLoadingDialog({String msg = "加载中..."}) async {
    SmartDialog.showLoading(msg: msg);
    try {
      final result = await this;
      return result;
    } finally {
      SmartDialog.dismiss(status: SmartStatus.loading);
    }
  }

  // 网络请求成功的回调
  Future<CommonResp<T>> onSuccess(Function(T? result) callback) {
    return then((value) {
      if (value.code == 0) {
        callback(value.result);
      }
      return value;
    });
  }

  void onFailedWithToast() {
    onFailed((code, msg, error) {
      print("LBLog onFailedWithToast ---- ${msg}");
      if (msg.isEmpty) {
        SmartDialog.showToast("错误码：$code");
      } else {
        SmartDialog.showToast(msg);
      }
    });
  }

  // 网络请求成功的回调
  void onFailed(Function(int code, String msg, dynamic error) callback) async {
    final task = then((value) {
      if (value.code != 0) {
        callback(value.code, value.msg, null);
      }
      return value;
    });
    try {
      await task;
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.badCertificate) {
          callback(-1, "您的处于不受信任的网络环境，请关闭代理/VPN软件后再试", e);
        } else if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          callback(-1, "网络连接超时", e);
        } else if (e.type == DioExceptionType.badResponse) {
          callback(-1, "${e.response?.statusCode}错误", e);
        } else if (e.type == DioExceptionType.connectionError) {
          callback(-1, "连接出错", e);
        } else if (e.type == DioExceptionType.unknown) {
          callback(-1, "未知网络错误", e);
        } else if (e.type == DioExceptionType.cancel) {
          // 无需处理
        }
      } else if (e is DioExceptionType) {
        callback(-1, "数据解析失败", e);
      } else {
        rethrow;
      }
    }
  }
}
