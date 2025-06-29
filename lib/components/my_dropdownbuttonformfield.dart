import 'package:flutter/material.dart';

class MyDropdownbuttonformfield extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? focusnext;
  final String? champ; 
  final FocusNode? focussubmission;

  const MyDropdownbuttonformfield({super.key,
    required this.hintText,
    required this.controller,
    this.focusNode,
    this.focusnext,
    this.champ,
    this.focussubmission,});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.surface),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
                fillColor: Theme.of(context).colorScheme.secondary,
                filled: true,
                hintText: hintText,
                hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),),
              value: null,
              hint: Text('Choisir un rôle'),
              items: ['Admin', 'Serveur', 'Livreur']
                  .map((role) => DropdownMenuItem(
                        value: role,
                        child: Text(role),
                      ))
                  .toList(),
              onChanged: (value) {
              },
            );
  }
}