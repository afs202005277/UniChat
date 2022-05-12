import 'package:flutter_test/flutter_test.dart';
import 'package:vertical_prototype/chat_info.dart';
import 'package:vertical_prototype/get_chat_list.dart';

import 'package:vertical_prototype/main.dart';
import 'package:vertical_prototype/top_bar.dart';
import 'package:vertical_prototype/all_chats_display.dart';

void main() {
  testWidgets('Home Page Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text("UNICHAT"), findsOneWidget);
    for(ChatInfo chatinfo in GetChatList.fetchAll(1)){
        expect(find.text(chatinfo.nomeCompleto), findsOneWidget);
        expect(find.text(chatinfo.numParticipantes.toString()), findsOneWidget);
        expect(find.text(chatinfo.turma), findsOneWidget);
        expect(find.text(chatinfo.sigla), findsOneWidget);
    }
  });
}
