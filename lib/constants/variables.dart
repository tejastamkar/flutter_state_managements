import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Category { food, travel, leisure, work }

const uuid = Uuid();

Map<Category, IconData> categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.airplane_ticket_rounded,
  Category.leisure: Icons.emoji_emotions_outlined,
  Category.work: Icons.work_outline
};
