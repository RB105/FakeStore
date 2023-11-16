abstract class NetworkResponse {
  NetworkResponse();
}

class NetworkSuccessResponse<T> extends NetworkResponse {
  T data; // dynamic data
  NetworkSuccessResponse(this.data);
}

class NetworkErrorResponse extends NetworkResponse {
  String error;
  NetworkErrorResponse(this.error);
}
