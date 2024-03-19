import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/counter_model.dart';

class HistoryList extends StatelessWidget {
  final List<CounterModel> history;
  
  const HistoryList({
    super.key,
    required this.history,
  });
  
  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        child: const Center(
          child: Text(
            'No history available',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
      );
    }
    
    return ListView.builder(
      shrinkWrap: true,
      itemCount: history.length,
      itemBuilder: (context, index) {
        final item = history[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: AppConstants.primaryColor,
            child: Text(
              '${item.value}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text('Value: ${item.value}'),
          subtitle: Text(
            '${item.action} • ${item.timestamp ?? 'Unknown time'}',
            style: const TextStyle(fontSize: 12),
          ),
        );
      },
    );
  }
}
