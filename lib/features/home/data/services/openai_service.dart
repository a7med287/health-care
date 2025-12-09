import 'package:dart_openai/dart_openai.dart';

class OpenAIService {
  OpenAIService() {
    OpenAI.apiKey = const String.fromEnvironment('OPENAI_API_KEY');
  }

  Future<String> sendMessageWithHistory(
      List<Map<String, String>> history) async {
    try {
      final chatHistory = history.map((msg) {
        return OpenAIChatCompletionChoiceMessageModel(
          role: msg["sender"] == "user"
              ? OpenAIChatMessageRole.user
              : OpenAIChatMessageRole.assistant,
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(
              msg["text"] ?? "",
            )
          ],
        );
      }).toList();

      // ✅ System prompt (Medical Guardrails)
      chatHistory.insert(
        0,
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.system,
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(
              """
أنت مساعد طبي محترف.
❗ ممنوع الرد على أي سؤال غير طبي.
❗ ممنوع تقديم تشخيص طبي مباشر.
❗ اجعل الردود واضحة – منظمة – قصيرة.
❗ لو السؤال غير طبي قل فقط:
"أعتذر، يمكنني المساعدة فقط في الأسئلة الطبية."
              """,
            ),
          ],
        ),
      );

      final response = await OpenAI.instance.chat.create(
        model: "gpt-4o-mini",
        messages: chatHistory,
        maxTokens: 350,
        temperature: 0.1,
      );

      final contentItems = response.choices.first.message.content;

      final text =
      contentItems?.map((item) => item.text).join("\n").trim();

      return text?.isNotEmpty == true
          ? text!
          : "لم يتم استلام رد من المساعد الطبي.";
    } catch (e) {
      print("❌ OpenAI ERROR: $e");
      return "⚠ حدث خطأ أثناء الاتصال بالخدمة.";
    }
  }
}
