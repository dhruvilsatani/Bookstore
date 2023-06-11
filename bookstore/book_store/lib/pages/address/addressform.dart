import 'package:book_store/api/models/customer.dart';
import 'package:book_store/pages/address/addresscontroller.dart';
import 'package:book_store/pages/checkout/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressFormScreen extends StatefulWidget {
  final Customer? address;

  AddressFormScreen({this.address});

  @override
  State<AddressFormScreen> createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  final Addresscontroller addresscontroller = Get.put(Addresscontroller());

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _localityController = TextEditingController();

  final _cityController = TextEditingController();

  final _stateController = TextEditingController();

  final _zipController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.address != null) {
      _nameController.text = widget.address!.name.toString();
      _localityController.text = widget.address!.locality.toString();
      _cityController.text = widget.address!.city.toString();
      _zipController.text = widget.address!.zipcode.toString();
      _stateController.text = widget.address!.state.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.address == null ? 'Add Address' : 'Edit Address'),
      // ),
      body: Column(
        children: [
          Container(
            height: 130,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  CustomText(
                    text:
                        widget.address == null ? 'Add Address' : 'Edit Address',
                    fontSize: 20,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _localityController,
                      decoration: InputDecoration(labelText: 'Street'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a street';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(labelText: 'City'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a city';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _stateController,
                      decoration: InputDecoration(labelText: 'State'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a state';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _zipController,
                      decoration: InputDecoration(labelText: 'Zip'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a zip';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (widget.address == null) {
                              addresscontroller.name = _nameController;
                              addresscontroller.locality = _localityController;
                              addresscontroller.city = _cityController;
                              addresscontroller.zipcode = _zipController;
                              addresscontroller.state = _stateController;
                              addresscontroller.addadress();
                              // addressController.saveAddress(newAddress);
                            } else {
                              addresscontroller.updateaddress(
                                  widget.address!.id,
                                  widget.address!.user,
                                  _nameController.text,
                                  _localityController.text,
                                  _cityController.text,
                                  _zipController.text,
                                  _stateController.text);
                              //  addressController.deleteAddress(widget.address!);
                              //addressController.saveAddress(newAddress);
                            }
                            Get.back();
                          }
                        },
                        child: Text('Save'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
