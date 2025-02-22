import 'package:dio/dio.dart';
import 'package:go_green/Core/Constant/utils/environment.dart';
import 'package:go_green/Core/Constant/utils/shared_pref.dart';
import 'package:go_green/Data/Models/home/hot_places/blogPost.dart';

class BlogRepository {
  final Dio _dio;
  final String baseUrl = Environment.baseUrl;
  final SharedPrefManager _sharedPrefManager;

  BlogRepository({
    required Dio dio,
    required SharedPrefManager sharedPrefManager,
  })  : _dio = dio,
        _sharedPrefManager = sharedPrefManager;

  static Future<BlogRepository> getInstance() async {
    final prefManager = await SharedPrefManager.getInstance();
    final dio = Dio();

    // Enable detailed logging
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ));

    // Adding an interceptor to handle the token expiration, also adding the token as a header
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = prefManager.getToken();
          print('Token being used: $token'); // Debug log

          if (!prefManager.isTokenValid()) {
            // Token invalid or expired
            print('No token found in SharedPreferences'); // Debug log
            await prefManager.clearSession();
            return handler.reject(
              DioException(
                requestOptions: options,
                error: 'Token expired',
                type: DioExceptionType.badResponse,
              ),
            );
          }

          options.headers.addAll({
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          });

          return handler.next(options);
        },
      ),
    );
    return BlogRepository(dio: dio, sharedPrefManager: prefManager);
  }

  Future<List<Blogpost>> fetchAllBlogPosts() async {
    try {
      final response = await _dio.get('$baseUrl/api/blogs');

      if (response.statusCode == 200) {
        List<dynamic> body = response.data;
        List<Blogpost> blogPosts =
            body.map((dynamic item) => Blogpost.fromJson(item)).toList();
        return blogPosts;
      } else {
        throw Exception('Failed to load blog posts');
      }
    } catch (e) {
      print('Error fetching blog posts: $e'); // Debug log
      throw Exception('Failed to load blog posts: $e');
    }
  }
}
