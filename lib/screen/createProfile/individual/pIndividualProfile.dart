import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:organizer/style.dart';

class PrtIndividualProfile extends StatefulWidget {
  @override
  _PrtIndividualProfileState createState() => _PrtIndividualProfileState();
}

class _PrtIndividualProfileState extends State<PrtIndividualProfile> {
  List<String> products = [
    'http://www.kustomclubs.com/wp-content/uploads/2019/07/IMG_2851-1024x575.jpg',
    'https://www.feelgoodevents.com.au/wp-content/uploads/2017/02/10933957_908820615818063_6504247213800313682_n-960x600.jpg',
    'https://image.cnbcfm.com/api/v1/image/105462444-1537465508117echo-dot-new.jpeg?v=1537465880&w=678&h=381',
    'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
    'https://dominicanexpert.com/wp-content/uploads/2016/06/fondo-2.jpg'
  ];

  @override
  Widget build(BuildContext context) {
  return SafeArea(
          child: SingleChildScrollView(
            child: Stack(fit: StackFit.loose, children: <Widget>[
              Container(
                margin: EdgeInsets.all(8.0),
                height: MediaQuery.of(context).size.height + 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  height: MediaQuery.of(context).size.height * .25,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.0, right: 10.0),
                    child: Text(
                      'Upload cover photo',
                      style: TextStyle(
                          color: Colors.grey, fontSize: NormalFonteSize),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage(SystemImagePath + 'imageplaceholder.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .20,
                left: 30.0,
                child: Container(
                  height: 90.0,
                  width: 90.0,
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3.0, color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                    onTap: (){
                       Fluttertoast.showToast(
                                  msg: "Coming Soon",
                                  toastLength: Toast.LENGTH_SHORT);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(.4),
                      backgroundImage: AssetImage(SystemImagePath + 'user.png'),
                      child: Text('LOGO',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .37,
                left: 20.0,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * .90,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              hintText: 'Full Name',
                              hintStyle: TextStyle(fontSize: TinyFontSize),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              hintText: 'Profession',
                              hintStyle: TextStyle(fontSize: TinyFontSize),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              hintText: 'Category',
                              hintStyle: TextStyle(fontSize: TinyFontSize),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              hintText: 'Bio',
                              hintStyle: TextStyle(fontSize: TinyFontSize),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              hintText: 'Address',
                              hintStyle: TextStyle(fontSize: TinyFontSize),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]))),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Create Event',
                          style: TextStyle(color: AppPrimaryDark),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.grey[300]),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: products.length,
                                  itemBuilder: (context, index) =>
                                      _getImageProducts(index),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          left: BorderSide(
                                              color: Colors.grey[200]))),
                                  padding: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      child: Icon(
                                        Icons.add_a_photo,
                                        size: 30,
                                      ),
                                      radius: 30.0,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ]),
          ),
        );
  }

  Widget _getImageProducts(int i) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: CircleAvatar(
          backgroundImage: NetworkImage(products[i]),
          radius: 30.0,
        ),
      ),
    );
  }
}
