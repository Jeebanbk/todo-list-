import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddItem extends StatefulWidget {
  String textname;
  AddItem({super.key, required this.textname});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) 
  
  {
    return Container(
      height: 70,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue[100],
      ),
      child: (Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check_box_outline_blank_outlined,
                //color: Colors.white,
              )),
          Text(
            widget.textname,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 130,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.redAccent,
              )),
        ],
      )),
    );
  }
}
