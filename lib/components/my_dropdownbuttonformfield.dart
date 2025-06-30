import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDropdownbuttonformfield extends StatefulWidget {
  //text when there is no choice yet 
  final String hintText;
  String? choice;
  //for the message in case of no choice during the submission 
  final String? champ; 
  final List<String> choices;
  ValueNotifier<String>? listener;

  MyDropdownbuttonformfield({super.key,
    required this.hintText,
    required this.choice,
    required this.champ,
    required this.choices,
    this.listener});

  @override
  State<MyDropdownbuttonformfield> createState() => _MyDropdownbuttonformfieldState();
}

class _MyDropdownbuttonformfieldState extends State<MyDropdownbuttonformfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, ),
      child: DropdownButtonFormField<String>(
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
                  hintText: widget.hintText,
                  hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                value: widget.choice,
                items: widget.choices.map((role) => DropdownMenuItem(
                          value: role,
                          child: Text(role),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    widget.choice = value;
                    if(widget.listener != null){
                      if (value == 'waiter'){
                        widget.listener!.value = 'assets/server.json';
                      }
                      if (value == 'Deliver'){
                        widget.listener!.value = 'assets/deliver.json';
                      }
                      if (value == 'Kitchen manager'){
                        widget.listener!.value = 'assets/kitchen_manager.json';
                      }
                    }
                  });
                },
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please choose a ${widget.champ}';
                  }
                  return null;
                },
              ),
    );
  }
}