import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../app_config.dart';
import '../constants.dart';

class ApiService {
  static const Duration timeout = Duration(seconds: 30);
  static const int maxRetries = 3;
  
  static Future<Map<String, dynamic>> _makeRequest(String url, {Map<String, String>? headers}) async {
    int attempts = 0;
    
    while (attempts < maxRetries) {
      try {
        final response = await http.get(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            ...?headers,
          },
        ).timeout(timeout);
        
        if (response.statusCode == 200) {
          return jsonDecode(response.body);
        } else if (response.statusCode >= 400 && response.statusCode < 500) {
          throw Exception('Client error: ${response.statusCode}');
        } else if (response.statusCode >= 500) {
          throw Exception('Server error: ${response.statusCode}');
        } else {
          throw Exception('Unexpected error: ${response.statusCode}');
        }
      } catch (e) {
        attempts++;
        if (attempts >= maxRetries) {
          debugPrint('API request failed after $maxRetries attempts: $e');
          rethrow;
        }
        debugPrint('API request attempt $attempts failed, retrying...');
        await Future.delayed(Duration(milliseconds: 1000 * attempts));
      }
    }
    
    throw Exception('Failed to complete request after $maxRetries attempts');
  }
  
  static Future<Map<String, dynamic>> getRecipes() async {
    return _makeRequest('${AppConfig.apiBaseUrl}/recipes');
  }
  
  static Future<Map<String, dynamic>> searchRecipes(String query, {Map<String, String>? filters}) async {
    final url = '${AppConfig.apiBaseUrl}/search?q=$query';
    return _makeRequest(url, headers: filters);
  }
  
  static Future<Map<String, dynamic>> getCategories() async {
    return _makeRequest('${AppConfig.apiBaseUrl}/categories');
  }
  
  static Future<Map<String, dynamic>> getRecipeDetails(String recipeId) async {
    return _makeRequest('${AppConfig.apiBaseUrl}/recipes/$recipeId');
  }
  
  static Future<Map<String, dynamic>> getRecipesByCategory(String categoryId, {int page = 1, int limit = 20}) async {
    final url = '${AppConfig.apiBaseUrl}/categories/$categoryId/recipes?page=$page&limit=$limit';
    return _makeRequest(url);
  }
  
  static Future<Map<String, dynamic>> getPopularRecipes({int limit = 10}) async {
    final url = '${AppConfig.apiBaseUrl}/recipes/popular?limit=$limit';
    return _makeRequest(url);
  }
  
  static Future<Map<String, dynamic>> getRecentRecipes({int limit = 10}) async {
    final url = '${AppConfig.apiBaseUrl}/recipes/recent?limit=$limit';
    return _makeRequest(url);
  }
}
