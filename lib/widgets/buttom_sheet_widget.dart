import 'package:flutter/material.dart';

abstract class BottomSheetItem {
  String get title;
  String? get iconPath => null;
}

class BottomSheetWidget {
  static showBottomSheet<T extends BottomSheetItem>({
    required List<T> items,
    required Function(T value) onTap,
    required BuildContext context,
  }) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        enableDrag: true,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  var item = items[index];
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          onTap(item);
                        },
                        title: Center(
                          child: Text(
                            item.title,
                          ),
                        )),
                  );
                }),
          );
        });
  }
}
