import 'package:url_launcher/url_launcher.dart';


 launchURL(String url) async {
  final Uri uri = Uri(scheme: "https", host: url);
  if(!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw "Can not launch url";
  }}

final Uri phoneNumber=Uri.parse('tel:+0201094529752');
final Uri whatsapp=Uri.parse('https://wa.me/01094529752');
final Uri youtube=Uri.parse('https://www.youtube.com/channel/UCZZMcqVVtQSsA5dnQ6xN8nQ');
final Uri facebook=Uri.parse('https://www.facebook.com/taher.salah.7927');
final Uri linkedin=Uri.parse('https://www.linkedin.com/in/taher-salah-1a5622134/');
final Uri github=Uri.parse('https://github.com/TaherSalah');
final Uri insta=Uri.parse('https://www.instagram.com/tahersalahm/');
const String logo='assets/images/perLogo.png';