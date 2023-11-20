import 'dart:convert';
import 'package:electrical_project/src/constants/auth.dart';
import 'package:http/http.dart' as http;

import 'package:electrical_project/src/features/chatbot/data/word_lists.dart';
import 'package:electrical_project/src/features/chatbot/domain/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatData extends Notifier<Chat> {
  @override
  Chat build() {
    return Chat(
      question: '',
      answer: '',
      isFetching: false,
      shouldWarn: false,
    );
  }

  bool isElectricalQuestion(String question) {
    return electricalKeywords.any(
        (keyword) => question.toLowerCase().contains(keyword.toLowerCase()));
  }

  String modifyQues(String question) {
    return '''Your task is to determine whether a given question belongs to the fields of physics, electrical engineering, or electronics. If the question does not belong to any of these fields, respond with a statement such as "This question appears to be related to electrical engineering or electronics." If the question does belong to one of these fields, provide a direct and accurate answer without mentioning the specific field.

For example, if the question is "What is Current Density," you should provide a clear and detailed explanation of current density without indicating whether it belongs to the field of electrical engineering or physics.

The question is "$question"''';
  }

  Future<void> askQuestion(String question) async {
    // state.copyWith(
    // isFetching: true,
    // );
    state = Chat(
      question: state.question,
      answer: state.answer,
      isFetching: true,
      shouldWarn: state.shouldWarn,
    );
    try {
      // state.copyWith(
      //   question: question,
      //   answer: "",
      // );
      state = Chat(
        question: question,
        answer: '',
        isFetching: state.isFetching,
        shouldWarn: state.shouldWarn,
      );

      if (question == "") {
        return;
      }
      if (!isElectricalQuestion(question)) {
        // state.copyWith(
        //   answer: "Only electrical subject questions are permitted.",
        //   shouldWarn: true,
        // );
        state = Chat(
            question: state.question,
            answer: 'Only electrical subject questions are permitted.',
            isFetching: state.isFetching,
            shouldWarn: true);

        return;
      }
      // state.copyWith(
      //   shouldWarn: false,
      // );
      state = Chat(
        question: state.question,
        answer: state.answer,
        isFetching: state.isFetching,
        shouldWarn: false,
      );

      String generatedText =
          await requestHttp(endPoint, apiKey, modifyQues(question));

      // Fallback in case of first api fails
      if (generatedText == 'An Error Occured') {
        generatedText =
            await requestHttp(endPoint1, apiKey1, modifyQues(question));
      }

      // state.copyWith(answer: generatedText);
      state = Chat(
        question: state.question,
        answer: generatedText,
        isFetching: state.isFetching,
        shouldWarn: state.shouldWarn,
      );
    } catch (error) {
      debugPrint(error.toString());
      // state.copyWith(answer: 'An Error Occured');
      state = Chat(
        question: state.question,
        answer: 'An Error Occured',
        isFetching: state.isFetching,
        shouldWarn: state.shouldWarn,
      );
    } finally {
      // state.copyWith(isFetching: false);
      state = Chat(
          question: state.question,
          answer: state.answer,
          isFetching: false,
          shouldWarn: state.shouldWarn);
    }
  }

  Future<String> requestHttp(String url, String apiKey, String question) async {
    Map<String, dynamic> data = {
      'model': 'gpt-4',
      'messages': [
        {
          'role': 'user',
          'content': question,
        }
      ],
    };

    String jsonBody = json.encode(data);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        var str = jsonDecode(response.body);
        final generatedText = str["choices"][0]["message"]["content"];
        debugPrint('Response data: ${response.body}');
        return generatedText;
      } else {
        // Handle errors
        debugPrint('Request failed with status code: ${response.statusCode}');
        debugPrint('Response data: ${response.body}');
        return 'An Error Occured';
      }
    } catch (e) {
      debugPrint('Error: $e');
      return 'An Error Occured';
    }
  }
}

final chatDataProvider = NotifierProvider<ChatData, Chat>(ChatData.new);
