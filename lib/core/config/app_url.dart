abstract class AppUrl {
  static const String baseURL = "https://jsonplaceholder.typicode.com/";
  static const String posts = "posts";
  static String comments(int id) => "posts/$id/comments";
}
