import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:radar/resources/pallete.dart';

/// Элемент списка дат отчетов с визуальной индикацией
/// 
/// Особенности:
/// - Материальный дизайн с эффектом возвышения
/// - Адаптивная ширина для разных экранов
/// - Интеграция с системой цветов [Pallete]
/// - Поддержка кастомного форматирования дат
/// - Ripple-эффект при взаимодействии
class ReportDateItem extends StatelessWidget {
  /// Дата отчета для отображения
  final DateTime date;
  
  /// Форматировщик дат для унификации отображения
  final DateFormat formatter;
  
  /// Коллбэк при нажатии на элемент
  final VoidCallback onTap;

  const ReportDateItem({
    super.key,
    required this.date,
    required this.formatter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Material(
        elevation: 3, // Тень для эффекта возвышения
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap, // Ripple-эффект при нажатии
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: double.infinity, // Заполнение доступной ширины
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Pallete.mainOrange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Отчет СУ от ${formatter.format(date)}', // Форматированная дата
                style: const TextStyle(
                  color: Pallete.textPageColorSecond,
                  fontSize: 20,
                  fontFamily: 'CuprumBold',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}