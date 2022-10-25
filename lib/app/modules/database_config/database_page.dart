import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'database_controller.dart';

class DatabasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<DatabaseController>(
      builder: (_) => Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Form(
            key: _.formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Align(
                  alignment: Alignment.center,
                  child: Form(
                    child: Container(
                      width: size.width * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'DATA BASE CONFIG',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Obx(
                            () => DropdownButton<String>(
                              value: _.databaseSelected,
                              isExpanded: true,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              hint: Text('Selecione a base de dados'),
                              icon: Icon(Icons.arrow_drop_down),
                              items: _.databases.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                _.setDatabaseSelected(value!);
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _.userNameController,
                            validator: _.validUserNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'USER NAME',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _.passwordController,
                            validator: _.validPasswordController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'PASSWORD',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _.serverController,
                            validator: _.validServerController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'SERVER',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _.portController,
                            validator: _.validPortController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'PORT',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: size.width * 0.5,
                            height: size.height * 0.05,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              child: Text('PROXIMO'),
                              onPressed: _.subimit,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
