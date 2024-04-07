import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../app_config.dart';

class ApiService {
  static const Duration timeout = Duration(seconds: 30);
  static const int maxRetries = 3;
  
  static Future<Map<String, dynamic>> getRecipes() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.apiBaseUrl}/recipes'),
      ).timeout(timeout);
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load recipes: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching recipes: $e');
      rethrow;
    }
  }
  
  static Future<Map<String, dynamic>> searchRecipes(String query) async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.apiBaseUrl}/search?q=$query'),
      ).timeout(timeout);
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to search recipes: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error searching recipes: $e');
      rethrow;
    }
  }
  
  static Future<Map<String, dynamic>> getCategories() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.apiBaseUrl}/categories'),
      ).timeout(timeout);
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching categories: $e');
      rethrow;
    }
  }
  
  static Future<Map<String, dynamic>> getRecipeDetails(String recipeId) async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.apiBaseUrl}/recipes/$recipeId'),
      ).timeout(timeout);
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load recipe details: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching recipe details: $e');
      rethrow;
    }
  }
  
  static Future<Map<String, dynamic>> getRecipesByCategory(String categoryId) async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.apiBaseUrl}/categories/$categoryId/recipes'),
      ).timeout(timeout);
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load recipes by category: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching recipes by category: $e');
      rethrow;
    }
  }
}
