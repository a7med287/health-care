import 'package:flutter/material.dart';

import '../../data/services/openai_service.dart';

class ChatPatientWidget extends StatefulWidget {
  const ChatPatientWidget({super.key});

  @override
  State<ChatPatientWidget> createState() => _ChatPatientWidgetState();
}

class _ChatPatientWidgetState extends State<ChatPatientWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> messages = [];
  final OpenAIService openAI = OpenAIService();

  @override
  void initState() {
    super.initState();
    messages.add({
      "sender": "bot",
      "text":
      "ℹ هذا المساعد يقدم معلومات طبية عامة ولا يُغني عن استشارة الطبيب المختص."
    });
  }

  bool isMedicalQuestion(String msg) {
    final text = msg.toLowerCase();

    final medicalKeywords = [
      // ===== Arabic =====
      "دواء","علاج","اعراض","أعراض","الم","ألم","وجع","صداع","مغص",
      "نزلة","برد","أنفلونزا","حرارة","حمى","كحة","سعال","ضيق نفس",
      "قيء","إسهال","غثيان","تعب","إرهاق","التهاب","عدوى","فيروس",
      "جرثومة","بكتيريا","مناعة","مرض","سكري","سكر","ضغط","قلب",
      "كلى","كبد","رئة","تنفس","اشعة","أشعة","تحليل","تحاليل",
      "جلدية","طفح","حكة","حساسية","مفصل","عضلات","عظم","ظهر",
      "جرح","نزيف","دم","دورة","حمل","رضيع","طفل","كبار السن",

      // ===== English =====
      "pain","ache","headache","migraine","fever","flu","cold",
      "cough","medicine","drug","treatment","therapy","symptom",
      "symptoms","test","tests","analysis","scan","x-ray","ct",
      "mri","disease","infection","virus","bacteria","diabetes",
      "blood pressure","heart","kidney","liver","lung","breathing",
      "vomiting","diarrhea","nausea","fatigue","rash","itching",
      "allergy","asthma","arthritis","injury","bleeding","pregnant",
      "baby","child","elderly","mental health","anxiety","depression"
    ];

    return medicalKeywords.any((w) => text.contains(w));
  }

  void sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({"sender": "user", "text": text});
      _controller.clear();
    });

    if (!isMedicalQuestion(text)) {
      setState(() {
        messages.add({
          "sender": "bot",
          "text":
          "⚠ من فضلك اطرح سؤالًا طبيًا فقط (أعراض، أدوية، تحاليل، معلومات صحية)."
        });
      });
      return;
    }

    setState(() {
      messages.add({"sender": "bot", "text": "⌛ جاري التفكير..."});
    });

    try {
      final reply = await openAI.sendMessageWithHistory(messages);

      setState(() {
        messages.removeLast();
        messages.add({"sender": "bot", "text": reply});
      });
    } catch (e) {
      setState(() {
        messages.removeLast();
        messages.add({
          "sender": "bot",
          "text": "⚠ حدث خطأ أثناء الاتصال بالخدمة. حاول مرة أخرى."
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xff0BA6A7),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "الدعم الطبي الذكي",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isUser = msg["sender"] == "user";

                return Align(
                  alignment:
                  isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color:
                      isUser ? const Color(0xff0BA6A7) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.15),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Text(
                      msg["text"]!,
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black87,
                        fontSize: 15.5,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey.withValues(alpha: 0.1), blurRadius: 6),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "اكتب سؤالك الطبي...",
                      filled: true,
                      fillColor: const Color(0xffF0F7F7),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: sendMessage,
                  child: CircleAvatar(
                    radius: 26,
                    backgroundColor: const Color(0xff0BA6A7),
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
