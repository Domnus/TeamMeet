
import 'user_model.dart';

class Message {
  final User sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: fredericoHanai,
    time: '5:30 PM',
    text: 'Não enche andressa...',
    unread: true,
  ),
  Message(
    sender: bentoCarlos,
    time: '4:30 PM',
    text: 'Vamos fazer o trabalho hoje?',
    unread: true,
  ),
  Message(
    sender: andressaReis,
    time: '3:30 PM',
    text: 'Calaboca HANAI',
    unread: false,
  ),
  Message(
    sender: pauloAstraukas,
    time: '2:30 PM',
    text: 'Hoje tem jogo do corinthians.',
    unread: true,
  ),
  Message(
    sender: fernandoCremonez,
    time: '1:30 PM',
    text: 'Posso falar para voces sobre IX/UX',
    unread: false,
  ),
  Message(
    sender: teste1,
    time: '12:30 PM',
    text: 'BAHHHHHH',
    unread: false,
  ),
  Message(
    sender: teste2,
    time: '11:30 AM',
    text: 'CRIANÇA É OQUE MAIS TEM',
    unread: false,
  ),
  Message(
    sender: teste3,
    time: '12:45 AM',
    text: 'oi linda, tem za?.',
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: fredericoHanai,
    time: '5:30 PM',
    text: 'Hey dude! Event dead I\'m the hero. Love you 3000 guys.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'We could surely handle this mess much easily if you were here.',
    unread: true,
  ),
  Message(
    sender: fredericoHanai,
    time: '3:45 PM',
    text: 'Take care of peter. Give him all the protection & his aunt.',
    unread: true,
  ),
  Message(
    sender: fredericoHanai,
    time: '3:15 PM',
    text: 'I\'m always proud of her and blessed to have both of them.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'But that spider kid is having some difficulties due his identity reveal by a blog called daily bugle.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Pepper & Morgan is fine. They\'re strong as you. Morgan is a very brave girl, one day she\'ll make you proud.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Yes Tony!',
    unread: true,
  ),
  Message(
    sender: teste3,
    time: '2:00 PM',
    text: 'I hope my family is doing well.',
    unread: true,
  ),
];
