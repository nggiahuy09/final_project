import 'dart:convert';
import 'dart:developer';

import 'package:final_project/models/kb_model.dart';
import 'package:flutter/material.dart';

import '../consts/api.dart';
import 'kb_authen_service.dart';
import 'package:http/http.dart' as http;

class KbService {
  static Future<KbModel?> createKnowledgeBase({
    required BuildContext context,
    required String kbName,
    String kbDesc = '',
  }) async {
    if (kbName.isEmpty) {
      return null;
    }

    final accessToken = await KBAuthService.getKbAccessToken(context);

    try {
      var headers = {
        'x-jarvis-guid': '',
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      };
      var request =
          http.Request('POST', Uri.parse('$kbAPIUrl/kb-core/v1/knowledge'));
      request.body = json.encode({
        "knowledgeName": kbName,
        "description": kbDesc,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = await response.stream.bytesToString();
        log('result of creating knowledge base: $result');
        return KbModel.fromJson(jsonDecode(result));
      } else {
        return null;
      }
    } catch (err) {
      log('Error in KB: ${err.toString()}');
      return null;
    }
  }
}
