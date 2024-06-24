import 'package:googleapis_auth/auth_io.dart';

class GetAccessToken {
  static String firebaseMessagingScope =
      "https://www.googleapis.com/auth/firebase.messaging";
  static Future<String> getAccessToken() async {
    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson(
          {
            "type": "service_account",
            "project_id": "ukn-earning-app",
            "private_key_id": "57f8519d356947f4487e57b6fe9f1f7c57d4162c",
            "private_key":
                "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQChnWF8jeqmCAf5\np3fIdnZmQx8ayRe0MelQJ505sF2Nzfc1tPP4wAqcRgVsxH+2Tp1IdDr3LL/jF+sY\n5/doduIlNzd/sf7ho/Xl+tklFz/Oy2po5wNZ9+oDQv7Wfm1FT92C/7JnVjTp5Bug\nnUraDfq2cMRvujIrMl2ljT0yCT/BUhJhaSRyfQMUAO83qVL3ic3U54CT1gK66sxj\n1BLdojaroD+1aGc8LdZsDqrt1jXg9/Glvq1Z0oPhvXaVio8Z4ixjPnP4NVbqs4K5\nRhNlZcnJedDEf/uUPeqoigPZn7fgOqu6nK37U9AYzO1QstPRFLRbW5NVklc2wKnj\nL2Vc+yKrAgMBAAECggEAQEAnvhNTip9dwFBmTBFgf8ZGiukQXeiL13xwQruNbe9I\nzRa7+ZQrg7ZIuNWj6k/1spTWzmaBgOCE7BloYCUHQgFiNIeIi58aBszD4D2OdgGj\ns8HHsNBhPdu4IYEQowIdz9Mk03VPwv6XRzLRS8BMAJTzW3G8OTUkSslMX2SS7qE3\nB0CgzzBSjjSq1N1aurSZC+fJNRvdWLjTFKhl+jXAduBOhHePzMbvwJLCMPggq71T\nupUaVbBTPUdW4yYSPezC2Z4+sF5BFbgLfqyMXoSlvtnze78yhJ1wq4cJ7cWOkteE\nT64xLy28fFbDxaKkaYg3Almzls0BXQpOHA4Tof065QKBgQDLy5XpT0I6mPLuUUqK\n+48NJ1tChnMZGdwbc9P1zoqAOBKO/JPrqLo77dg5UA64mF9XRKktK4R9ii1MNkyh\n0yvtz944XqrwsLqyaP/oTEYAZ3wdvKw9a12c0AQTxj+YmBDDhvnIkwTuP3m27DgA\nemb2AfKA3DEexmvHrLuzhB8W/QKBgQDLA7KonuXQcGlTqQXFQdI+ixTXUnvhOjiu\nwGGOoasFSlepHoYU++eeVG3r1Y5J3OIpkqkWGKwYakZwFF8eYSXESHcFKkHE7ivg\nAz3FoQLvrEj4OuOGZEMkOFrPFpas2rxObMRZO36adKejMmFO36VNkOIq+B+l4p7t\ndZ0bi36UxwKBgGtwxnT9IyZvckuwMcN6Ah3mLNeyuEV4e7FBbHK/1AbrCOW3RWjN\nSHnF1+PHUCuDsWf5u9MjiTMCQQVX7yi1gwhaOYawaiCAm7zpXFkktRcLd8TZrlin\nHPBKPowKTYbuTJA4vcE/uS696jZE7PVbkqKJvkavT3oxE6tuZnqq4hUlAoGAMMIG\nmrDvCQy2fz1NAX85e4Pz0XMiBYnyKyZRR+xUIsUkIJ4QHeISUth8PfPgZKUEPG/Y\n5FGwo3yCxlBeN/GlHGs7CqaHfUCmkPq2T0zIY7/BFr0uAAz8gyp1xN7r+T/fkgZV\ncgjz8yypRmzHKiZUkTiG2UMWdsTi3q0sunzaPekCgYAYywLJujHkO7LB/QkEoQMM\niVk5tpH1xG1gO3+lHVsSPKX9unw7V681BYizVP+oGzbZ4ovUCaAtou/NBJGuZ7xO\n5q/1jypuew40H2EMSjLg4Y28wfM0J11o7ZPBJC2h6Ta3t7SITdgprDjDYya0NO6q\nelarBN81p0nEIeuQdULIxg==\n-----END PRIVATE KEY-----\n",
            "client_email":
                "firebase-adminsdk-91xxs@ukn-earning-app.iam.gserviceaccount.com",
            "client_id": "100261482188986169955",
            "auth_uri": "https://accounts.google.com/o/oauth2/auth",
            "token_uri": "https://oauth2.googleapis.com/token",
            "auth_provider_x509_cert_url":
                "https://www.googleapis.com/oauth2/v1/certs",
            "client_x509_cert_url":
                "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-91xxs%40ukn-earning-app.iam.gserviceaccount.com",
            "universe_domain": "googleapis.com"
          },
        ),
        [firebaseMessagingScope]);

    final accessToken = client.credentials.accessToken.data;
    return accessToken;
  }
}
