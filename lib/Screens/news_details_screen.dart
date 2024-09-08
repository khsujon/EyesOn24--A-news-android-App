import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewsDetailsScreen extends StatefulWidget {
  final String image, title, author, date, source, description, content, url;

  NewsDetailsScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.author,
    required this.date,
    required this.source,
    required this.description,
    required this.content,
    required this.url,
  }) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  final format = DateFormat('MMMM dd, yyyy');

  // Future<void> _launchURL(String url) async {
  //   String encodedUrl = Uri.encodeFull(url);
  //   Uri uri = Uri.parse(encodedUrl);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri, mode: LaunchMode.externalApplication);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    DateTime dateTime = DateTime.parse(widget.date);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w800, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade200,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: height * 0.45,
                child: ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: widget.image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      child: spinKit2,
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Container(
                height: height * 0.55,
                decoration: BoxDecoration(color: Colors.grey.shade100),
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03, vertical: height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.author != "null"
                                  ? widget.author
                                  : widget.source,
                              style: GoogleFonts.aboreto(
                                  fontWeight: FontWeight.w700, fontSize: 12),
                            ),
                          ),
                          Text(
                            format.format(dateTime),
                            style: GoogleFonts.acme(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.author == "null" || widget.author == widget.source
                          ? ''
                          : widget.source,
                      style: GoogleFonts.girassol(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.blue),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Text(
                      widget.description,
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.black87),
                    ),
                    // Container(
                    //   alignment: Alignment.bottomRight,
                    //   child: ElevatedButton.icon(
                    //     style: ButtonStyle(),
                    //     onPressed: () {
                    //       _launchURL(widget.url); // Call the launch function
                    //     },
                    //     icon: Icon(Icons.arrow_forward),
                    //     label: Text('Source'),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const spinKit2 = SpinKitFadingCircle(
  color: Colors.amber,
  size: 50,
);
