import 'package:flutter/material.dart';
import 'package:vegetables_ravet/api_services/CityApi.dart';
import 'package:vegetables_ravet/models/CityModels.dart';

class RegistorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistorState();
  }
}

class RegistorState extends State<RegistorScreen> {
  List<CityModels> cityModels;
  String cityVal;
  String cityId;


  @override
  void initState() {
    super.initState();

    CityApi.getCityDetail().then((value) {
      setState(() {
        cityModels = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registor"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('images/logo.jpeg'),
              width: 150,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5)),
                    hintText: 'Name',
                    labelText: 'Enter the Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLength: 10,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5)),
                    hintText: 'Mobile',
                    counterText: '',
                    labelText: 'Enter Mobile Number'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5)),
                    hintText: 'Password',
                    labelText: 'Enter Password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5)),
                    hintText: 'Confirm Password',
                    labelText: 'Enter Confirm Password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5)),
                    hintText: 'Flat No/Address',
                    labelText: 'Enter Flat No/ Address'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.5)
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(



                    value: cityVal,
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Select Area'),
                    ),
                    dropdownColor: Colors.grey,
                    style: TextStyle(color: Colors.black,),

                    elevation: 5,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    onChanged: (value) {

                      setState(
                        () {

                          cityVal = value;
                        },
                      );
                    },
                    items: cityModels?.map((value) {
                      return DropdownMenuItem(value: value.societyName,
                          onTap: ()
                          {
                            cityId=value.id;
                            print("socityId $cityId");
                          },
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),

                        child: Text(value.societyName,),


                      ));
                    })?.toList() ?? [],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Register'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}