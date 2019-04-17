/* Created by Sahil Bharti on 13/4/19.
 *
*/
class ApiResponse<ResultType> {
  Status status;
  ResultType data;
  Exception error;

  ApiResponse(Status status, ResultType data, Exception error) {
    this.status = status;
    this.data = data;
    this.error = error;
  }

  static ApiResponse loading<ResultType>() {
    return new ApiResponse<ResultType>(Status.LOADING, null, null);
  }

  static ApiResponse success<ResultType>(ResultType data) {
    return new ApiResponse<ResultType>(Status.SUCCESS, data, null);
  }

  static ApiResponse failed<ResultType>(Exception error) {
    return new ApiResponse<ResultType>(Status.ERROR, null, error);
  }
}

enum Status { LOADING, SUCCESS, ERROR }
