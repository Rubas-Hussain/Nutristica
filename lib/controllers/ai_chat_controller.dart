import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/ai_models/ai_chat_model.dart';

class AIChatController extends GetxController{

  TextEditingController chatController=TextEditingController();

  List<AIChatModel> chats = [
    AIChatModel(
      text: 'Hello',
      sentByMe: true,
    ),
    AIChatModel(
      text: 'Hello! How can I help you today?',
      sentByMe: false,
    ),
    AIChatModel(
      text: 'I want to generate a diet plan.',
      sentByMe: true,
    ),
    AIChatModel(
      text: 'Sure! I can help with that 😊',
      sentByMe: false,
    ),
    AIChatModel(
      text: 'Can you tell me your age, height, and weight?',
      sentByMe: false,
    ),
    AIChatModel(
      text: 'I am 24 years old, 5’9” tall, and weigh 75 kg.',
      sentByMe: true,
    ),
    AIChatModel(
      text: 'Great! Do you have any specific goals?',
      sentByMe: false,
    ),
    AIChatModel(
      text: 'I want to lose fat and gain some muscle.',
      sentByMe: true,
    ),
    AIChatModel(
      text: 'Got it 💪 Do you follow any specific diet?',
      sentByMe: false,
    ),
    AIChatModel(
      text: 'No, I eat everything.',
      sentByMe: true,
    ),
    AIChatModel(
      text: 'Perfect! Here’s a balanced diet plan for you:',
      sentByMe: false,
    ),
    AIChatModel(
      text:
      'Breakfast: Oats with milk & fruits\nLunch: Grilled chicken with rice\nDinner: Vegetables & protein\nSnacks: Nuts & yogurt',
      sentByMe: false,
    ),
    AIChatModel(
      text: 'That looks good. Can you also suggest a workout?',
      sentByMe: true,
    ),
    AIChatModel(
      text: 'Absolutely! I’ll create a simple weekly workout plan for you 🏋️‍♂️',
      sentByMe: false,
    ),
  ];


  bool speakNow=false;
  aiSpeakingHandler(){
    speakNow=!speakNow;
    update();
  }

  Rx<bool> isLoading=false.obs;
  // chatWithGemini() async {
  //   if(chatController.text.trim().isEmpty) return;
  //   chats.add(AIChatModel(
  //       text: chatController.text,
  //       sentByMe: true
  //   ));
  //   chats.add(AIChatModel(
  //       text: 'kadjaskldjajdalksjdlkasjd',
  //       sentByMe: false
  //   ));
  //
  //   final prompt=chatController.text;
  //   chatController.clear();
  //   update();
  //   isLoading.value=true;
  //   update();
  //   final data=await ChatService.chatWithGemini(prompt: prompt);
  //   if(data!=null){
  //     chats.removeLast();
  //     chats.add(data);
  //     isLoading.value=false;
  //     update();
  //     return true;
  //   }
  //   chats.removeLast();
  //   chats.removeLast();
  //   isLoading.value=false;
  //   update();
  //   return false;
  // }

}