// // // // class AddEditAddressScreen extends StatelessWidget {
// // // //   final _streetController = TextEditingController();
// // // //   final _cityController = TextEditingController();
// // // //   final _stateController = TextEditingController();
// // // //   final _zipCodeController = TextEditingController();
  
// // // //   final AddressController addressController = Get.put(AddressController());
  
// // // //   final Address address;
// // // //   final bool isEditing;
  
// // // //   AddEditAddressScreen({this.address, this.isEditing});
  
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     if (isEditing) {
// // // //       _streetController.text = address.street;
// // // //       _cityController.text = address.city;
// // // //       _stateController.text = address.state;
// // // //       _zipCodeController.text = address.zipCode;
// // // //     }
    
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text(isEditing ? 'Edit Address' : 'Add Address'),
// // // //       ),
// // // //       body: Padding(
// // // //         padding: const EdgeInsets.all(16.0),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.stretch,
// // // //           children: [
// // // //             TextField(
// // // //               controller: _streetController,
// // // //               decoration: InputDecoration(
// // // //                 labelText: 'Street',
// // // //               ),
// // // //             ),
// // // //             SizedBox(height: 16),
// // // //             TextField(
// // // //               controller: _cityController,
// // // //               decoration: InputDecoration(
// // // //                 labelText: 'City',
// // // //               ),
// // // //             ),
// // // //             SizedBox(height: 16),
// // // //             TextField(
// // // //               controller: _stateController,
// // // //               decoration: InputDecoration(
// // // //                 labelText: 'State',
// // // //               ),
// // // //             ),
// // // //             SizedBox(height: 16),
// // // //             TextField(
// // // //               controller: _zipCodeController,
// // // //               decoration: InputDecoration(
// // // //                 labelText: 'Zip Code',
// // // //               ),
// // // //             ),
// // // //             SizedBox(height: 32),
// // // //             RaisedButton(
// // // //               child: Text(isEditing ? 'Update' : 'Add'),
// // // //               onPressed: () async {
// // // //                 final newAddress = Address(
// // // //                   street: _streetController.text,
// // // //                   city: _cityController.text,
// // // //                   state: _stateController.text,
// // // //                   zipCode: _zipCodeController.text,
// // // //                 );
                
// // // //                 if (isEditing) {
// // // //                   newAddress.id = address.id;
// // // //                   await addressController.updateAddress(newAddress);
// // // //                 } else {
// // // //                   await addressController.addAddress(newAddress);
// // // //                 }
                
// // // //                 Navigator.pop(context);
// // // //               },
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }


// // // here's an example code for a screen that displays multiple addresses, allows you to add new addresses, and edit existing addresses using GetX for managing state and the HTTP package for making API requests to a Django REST API:
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // class Address {
// //   String id;
// //   String street;
// //   String city;
// //   String state;
// //   String zip;

// //   Address({this.id, this.street, this.city, this.state, this.zip});
// // }

// // class AddressController extends GetxController {
// //   var addresses = <Address>[].obs;

// //   @override
// //   void onInit() {
// //     super.onInit();
// //     fetchAddresses();
// //   }

// //   void fetchAddresses() async {
// //     final response =
// //         await http.get(Uri.parse('http://yourapi.com/api/addresses/'));
// //     final List data = jsonDecode(response.body);
// //     addresses.value =
// //         data.map((model) => Address.fromJson(model)).toList();
// //   }

// //   void addAddress(Address address) async {
// //     final response = await http.post(
// //       Uri.parse('http://yourapi.com/api/addresses/'),
// //       headers: <String, String>{'Content-Type': 'application/json'},
// //       body: jsonEncode(address.toJson()),
// //     );
// //     if (response.statusCode == 201) {
// //       addresses.add(Address.fromJson(jsonDecode(response.body)));
// //     } else {
// //       // Handle error
// //     }
// //   }

// //   void updateAddress(Address address) async {
// //     final response = await http.put(
// //       Uri.parse('http://yourapi.com/api/addresses/${address.id}/'),
// //       headers: <String, String>{'Content-Type': 'application/json'},
// //       body: jsonEncode(address.toJson()),
// //     );
// //     if (response.statusCode == 200) {
// //       int index =
// //           addresses.indexWhere((element) => element.id == address.id);
// //       addresses[index] = Address.fromJson(jsonDecode(response.body));
// //     } else {
// //       // Handle error
// //     }
// //   }

// //   void deleteAddress(Address address) async {
// //     final response = await http.delete(
// //       Uri.parse('http://yourapi.com/api/addresses/${address.id}/'),
// //     );
// //     if (response.statusCode == 204) {
// //       addresses.removeWhere((element) => element.id == address.id);
// //     } else {
// //       // Handle error
// //     }
// //   }
// // }

// // class AddressScreen extends StatelessWidget {
// //   final AddressController controller = Get.put(AddressController());

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Addresses'),
// //       ),
// //       body: Obx(
// //         () => ListView.builder(
// //           itemCount: controller.addresses.length,
// //           itemBuilder: (context, index) {
// //             final address = controller.addresses[index];
// //             return ListTile(
// //               title: Text(address.street),
// //               subtitle: Text('${address.city}, ${address.state} ${address.zip}'),
// //               trailing: IconButton(
// //                 icon: Icon(Icons.delete),
// //                 onPressed: () => controller.deleteAddress(address),
// //               ),
// //               onTap: () => _editAddress(context, address),
// //             );
// //           },
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () => _addAddress(context),
// //         child: Icon(Icons.add),
// //       ),
// //     );
// //   }

// //   void _addAddress(BuildContext context) {
// //     final TextEditingController streetController = TextEditingController();
// //     final TextEditingController cityController = TextEditingController();
// //     final TextEditingController stateController = TextEditingController();
   

// // void _addAddress(BuildContext context) {
// //     final TextEditingController streetController = TextEditingController();
// //     final TextEditingController cityController = TextEditingController();
// //     final TextEditingController stateController = TextEditingController();
// //     final TextEditingController zipController = TextEditingController();

// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: Text('Add Address'),
// //         content: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             TextField(
// //               controller: streetController,
// //               decoration: InputDecoration(hintText: 'Street'),
// //             ),
// //             TextField(
// //               controller: cityController,
// //               decoration: InputDecoration(hintText: 'City'),
// //             ),
// //             TextField(
// //               controller: stateController,
// //               decoration: InputDecoration(hintText: 'State'),
// //             ),
// //             TextField(
// //               controller: zipController,
// //               decoration: InputDecoration(hintText: 'ZIP'),
// //             ),
// //           ],
// //         ),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Get.back(),
// //             child: Text('Cancel'),
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               final newAddress = Address(
// //                 street: streetController.text,
// //                 city: cityController.text,
// //                 state: stateController.text,
// //                 zip: zipController.text,
// //               );
// //               controller.addAddress(newAddress);
// //               Get.back();
// //             },
// //             child: Text('Add'),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// // void _editAddress(BuildContext context, Address address) {
// //     final TextEditingController streetController = TextEditingController(text: address.street);
// //     final TextEditingController cityController = TextEditingController(text: address.city);
// //     final TextEditingController stateController = TextEditingController(text: address.state);
// //     final TextEditingController zipController = TextEditingController(text: address.zip);

// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: Text('Edit Address'),
// //         content: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             TextField(
// //               controller: streetController,
// //               decoration: InputDecoration(hintText: 'Street'),
// //             ),
// //             TextField(
// //               controller: cityController,
// //               decoration: InputDecoration(hintText: 'City'),
// //             ),
// //             TextField(
// //               controller: stateController,
// //               decoration: InputDecoration(hintText: 'State'),
// //             ),
// //             TextField(
// //               controller: zipController,
// //               decoration: InputDecoration(hintText: 'ZIP'),
// //             ),
// //           ],
// //         ),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Get.back(),
// //             child: Text('Cancel'),
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               final editedAddress = Address(
// //                 id: address.id,
// //                 street: streetController.text,
// //                 city: cityController.text,
// //                 state: stateController.text,
// //                 zip: zipController.text,
// //               );
// //               controller.editAddress(editedAddress);
// //               Get.back();
// //             },
// //             child: Text('Save'),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'address.dart';
// import 'address_controller.dart';

// class AddressFormScreen extends StatelessWidget {
//   final AddressController addressController = Get.find();
//   final Address? address;

//   AddressFormScreen({this.address});

//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _streetController = TextEditingController();
//   final _cityController = TextEditingController();
//   final _stateController = TextEditingController();
//   final _zipController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     if (address != null) {
//       _nameController.text = address!.name;
//       _streetController.text = address!.street;
//       _cityController.text = address!.city;
//       _stateController.text = address!.state;
//       _zipController.text = address!.zip;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(address == null ? 'Add Address' : 'Edit Address'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _streetController,
//                 decoration: InputDecoration(labelText: 'Street'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a street';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _cityController,
//                 decoration: InputDecoration(labelText: 'City'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a city';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _stateController,
//                 decoration: InputDecoration(labelText: 'State'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a state';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _zipController,
//                 decoration: InputDecoration(labelText: 'Zip'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a zip';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       final newAddress = Address(
//                         name: _nameController.text,
//                         street: _streetController.text,
//                         city: _cityController.text,
//                         state: _stateController.text,
//                         zip: _zipController.text,
//                       );
//                       if (address == null) {
//                         addressController.saveAddress(newAddress);
//                       } else {
//                         addressController.deleteAddress(address!);
//                         addressController.saveAddress(newAddress);
//                       }
//                       Get.back();
//                     }
//                   },
//                   child: Text('Save'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// addresscontroller.name = _nameController;
//                       addresscontroller.locality = _localityController;
//                       addresscontroller.city = _cityController;
//                       addresscontroller.zipcode = _zipController;
//                       addresscontroller.state = _stateController;
//                       addresscontroller.addadress();
