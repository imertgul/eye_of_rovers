# Eye of rover

This app includes image data gathered by NASA's Curiosity, Opportunity, and Spirit rovers on 
Mars with  given filters (Sol and Camera). 

Login with Facebook needed.

    App is only compatible with Android!!

## Features
 - Firebase Facebook Auth
 - Cupertino widgets only
 - Each gallery by rover
 - Get photos by filter
    - Sol ((Martian rotation or day) on which they were taken, counting up 
from the rover's landing date.)
    - Camera which it was taken
 

You can download apk from releases.

<p float="left">
  <img src="https://raw.githubusercontent.com/imertgul/eye_of_rovers/master/screenshots/Screenshot_1637692094.png?token=AFPPHGJMNMMZIANOTF4VM4TBTUZ7K" width = 150>
  <img src="https://raw.githubusercontent.com/imertgul/eye_of_rovers/master/screenshots/Screenshot_1637692113.png?token=AFPPHGOAD5YY64PU64ADCSDBTUZ7O" width = 150>
  <img src="https://raw.githubusercontent.com/imertgul/eye_of_rovers/master/screenshots/Screenshot_1637692207.png?token=AFPPHGNDDT6T24A3E2KQYBTBTUZ7I" width = 150>
  <img src="https://raw.githubusercontent.com/imertgul/eye_of_rovers/master/screenshots/Screenshot_1637692123.png?token=AFPPHGIPEFBZJQG67JWHXE3BTUZ7Q" width = 150>
  <img src="https://raw.githubusercontent.com/imertgul/eye_of_rovers/master/screenshots/Screenshot_1637692158.png?token=AFPPHGM77CL4E6WUC63ZFEDBTUZ7U" width = 150>
</p>

## Start Projects
Set up Firebase Auth first.
[Flutter Fire Docs](https://firebase.flutter.dev/docs/overview)
[flutter_facebook_auth Docs](https://facebook.meedu.app/#/)

You have to set Nasa api key for `NasaHelper` class.

```
flutter pub get
flutter run
```
 