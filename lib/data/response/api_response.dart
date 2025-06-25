import 'package:provider_test/data/response/status.dart';

class ApiResponse<T> {
  String? message;
  T? data;
  Status? status;

  @override
  String toString() {
    return 'Status: $status \nMessage: $message \nData: $data';
  }

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed() : status = Status.completed;

  ApiResponse.error() : status = Status.error;
}
