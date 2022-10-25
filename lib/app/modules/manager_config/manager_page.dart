import 'package:brasil_fields/brasil_fields.dart';
import 'package:data7_api_pix_config/app/modules/manager_config/manager_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<ManagerController>(
      builder: (_) => Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Form(
            child: SingleChildScrollView(
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Align(
                  alignment: Alignment.center,
                  child: Form(
                    key: _.formKey,
                    child: Container(
                      width: size.width * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'GERENCIADOR PIX',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Obx(
                            () => DropdownButton<String>(
                              value: _.gerenciadoraSelected,
                              isExpanded: true,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              hint: Text('Selecione a gerenciadora'),
                              icon: Icon(Icons.arrow_drop_down),
                              items: _.gerenciadora.map((String value) {
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
                            keyboardType: TextInputType.text,
                            controller: _.cnpjController,
                            validator: _.validCNPJController,
                            decoration: InputDecoration(
                              labelText: 'CNPJ',
                              border: OutlineInputBorder(),
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CnpjInputFormatter(),
                            ],
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _.clientId,
                            validator: _.valisClientId,
                            decoration: InputDecoration(
                              labelText: 'client id',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _.clientSecret,
                            validator: _.validClientSecret,
                            decoration: InputDecoration(
                              labelText: 'client secret',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton.icon(
                                  icon: Icon(Icons.file_copy_outlined),
                                  label: Text('CERTIFICADO'),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 15)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Color.fromARGB(255, 70, 194, 74),
                                    ),
                                  ),
                                  onPressed: _.selectFile),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: size.width * 0.5,
                            height: size.height * 0.05,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                  child: Text('VOLTAR'),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                  child: Text('SALVAR'),
                                  onPressed: _.subimit,
                                ),
                              ],
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
