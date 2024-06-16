## React Native App Development

### References
* [Blog - How to publish your app to Apple store](https://medium.com/@the_manifest/how-to-publish-your-app-on-apples-app-store-in-2018-f76f22a5c33a)
* [Blog - Generate screenshots and previews for submitting app to Apple store](https://medium.com/@reefwing/ios-app-screenshots-and-previews-for-itunes-connect-a5813bb1c47c)
* To install latest expo client on similator, use:
  * `expo client:install:ios` and `expo client:install:android`


### Installation
* [Installation Guide](https://docs.expo.io/versions/latest/introduction/installation/)
  * Install latest version of Node (v10 or higher) from [here](https://nodejs.org/en/)
    * Verify that you're using latest version of node by running command - `node -v`
    * If the version is not latest then verify that your PATH envrironment variable is set correctly and restart terminal
  * Install Expo CLI by running `npm install -g expo-cli`
  * I didn't install watchman to start with but eventually did (don't remember exactly why)
  

### Up and Running 
* Follow instructions [here](https://docs.expo.io/versions/latest/workflow/up-and-running/) to create your first project using Expo CLI and then launch it on device. You can try running on iOS simulator as well.

### Next Steps
* [Additional EXPO Resources](https://docs.expo.io/versions/latest/introduction/additional-resources/#additional-resources)
* Do a quick read over [React Native Express](http://www.reactnativeexpress.com/)
* [Expo Examples/Tutorials](https://blog.expo.io/examples-tutorials-e471ba902b1f)


### TypeScript
  * Install TypeScript - `npm install -D typescript`
  * NPM gave some warnings, ignored for now:
  ```
  npm WARN expo-google-sign-in@2.0.0 requires a peer of react-native@^0.55.4 but none is installed. You must install peer dependencies yourself.
  npm WARN react-native-reanimated@1.0.0-alpha.11 requires a peer of react@16.0.0-alpha.6 but none is installed. You must install peer dependencies yourself.
  npm WARN react-native-reanimated@1.0.0-alpha.11 requires a peer of react-native@^0.44.1 but none is installed. You must install peer dependencies yourself.
  npm WARN url-loader@1.1.2 requires a peer of webpack@^3.0.0 || ^4.0.0 but none is installed. You must install peer dependencies yourself.
  ```
* Install TypeScript Linter
  * `npm install -D tslint`
* Install type definitions for react
  * `npm install -D @types/react @types/react-native @types/react-dom`
* We’ll also need rimraf and concurrently to clean the output folder for ts-transpiled-to-js files and concurrently running npm scripts
  * `npm install -D concurrently rimraf`
* Set up your Typescript config file (tsconfig.json)
  * `npx tsc --init`
  * Copy below content to tsconfig.json:
  ```json
  {
    "compilerOptions": {
        "module":"es2015",
        "target": "es2015",
        "jsx": "react-native",
        "rootDir": "src",
        "outDir": "build",
        "allowSyntheticDefaultImports": true,
        "noImplicitAny": true,
        "sourceMap": true,
        "experimentalDecorators": true,
        "preserveConstEnums": true,
        "allowJs": true,
        "noUnusedLocals": true,
        "noUnusedParameters": true,
        "noImplicitReturns": true,
        "skipLibCheck": true,
        "moduleResolution":"Node"
    },
    "filesGlob": [
        "typings/index.d.ts",
        "src/**/*.ts",
        "src/**/*.tsx",
        "node_modules/typescript/lib/lib.es6.d.ts"
    ],
    "types": [
      "react",
      "react-dom",
      "react-native"
    ],
    "exclude":[
        "build", 
        "node_modules",
        "jest.config.js",
        "App.js"
        
    ],
    "compileOnSave": false
  }
  ```
* Since we use TypeScript, we don’t need babel. Following commands remove it
  * `rm babel.config.js`
  * `npm uninstall -D babel-preset-expo`
* Since we configured `src` and `build` as `rootDir` and `outputDir` in the `tsconfig.json`, create these folders under our project’s root folder. With “rootDir”: “src , the Typescript compiler will look for all the .ts or .tsx files within thesrc folder and its subfolders.
  * `mkdir src`
  * `mkdir build`
* TS Lint - Create tslint.json file
  * `npx tslint --init`
* Move `App.js` to `src` folder and rename it to `App.tsx`
  * `mv App.js ./src/`
  * `mv ./src/App.js ./src/App.tsx`
* Add `App.js` file, that will simply export `App` component from `App.tsx`, with below content:
  ```typescript
  import App from './build/App';
  export default App;
  ```
* Add below scripts to `package.json` 
  ```json
    "lint": "tslint src/**/*.ts*",
    "tsc": "tsc",
    "clean": "rimraf build",
    "build": "npm run clean && npm run tsc --",
    "watch": "npm run build -- -w",
    "watchAndRunAndroid": "concurrently \"npm run watch\" \"npm run android\"",
    "buildRunAndroid": "npm run build && npm run watchAndRunAndroid ",
    "watchAndRunIOS": "concurrently \"npm run watch\" \"npm run ios\"",
    "buildRunIOS": "npm run build && npm run watchAndRunIOS ",
    "watchAndStart": "concurrently \"npm run watch\" \"npm run start\"",
    "buildAndStart": "npm run build && npm run watchAndStart "
  ```
* Run app
  * `npm run buildAndStart`


### iOS Simulator
* Install XCode from AppStore
* Start Expo development server i.e. run app using - `npm run buildAndStart` 
* Go to Expo Developer Tools, in my case running at http://localhost:19002 (check terminal output for the port number) and click on "Run on iOS simulator"
  * I had an error that prompted me to run - `sudo xcode-select -s /Applications/Xcode.app`


### UI Navigation
* Install package
  * `npm install --save react-navigation`
* Install types
  * `npm install --save-dev @types/react-navigation`
* [Reference](https://reactnavigation.org/docs/en/hello-react-navigation.html)


#### Ad Options
* Paid version and ad version of app
  * Chances are people would use free version of app as they have to only use it for few minutes everyday and never buy paid version
  * Also with the ad version of app you risk losing user because showing too many ads in a short span of time might annoy user
* Free app with banner ads
  * To start with, this sounds like a safe bet as you would get idea about the app downloads and app usage and then you can decide better based on data
  * How would I get data about app usage? - This is something that needs to be built into the app such that it would call home for example, every time a user taps on generate flash card button
  * Any way to identify usage from AdMob?
* Freemium
  * _Probably_ costly to build the feature and then most likely this would annoy the users that for a trivial feature like this they have to pay
  * Another view point - this provides a very specific useful functionality and parents would not mind paying for it to start with. This would be driven by usage by each user.

#### Questions
* What's CPM?
  * Cost per (thousand) impressions
* What's eCPM?
* Do you get paid for ad being displayed or only when user clicks on ad?
  * Both, but I believe when user clicks on ad there is more money.
* Consider worst case scenario of no ad ever being clicked and there are only few hundred users and they use it on average of no more than an hour a month. What does this number look like?
  * Looks like I will be able to recover most of membership cost
* Lastly, also consider an option of renting app store membership such that you publish app through another person for a commission.


Run on Android, 

#### Analytics Service
* Every time user clicks on one of the flash card options you need to capture data for the usage. Call a service that would register some of the details such as:
  * Source - Hindi flash card app (this service could be used by future apps/products)
  * Unique Id of user/device/app
  * Date and time stamp of action
  * Which option was selected by user
* Would also need to track the amount of time user uses the app, that would be:
  * Every time user starts/resumes the app
  * Every time user kills/pauses the app
* Keep the payload as JSON so that future changes to analytics data would not require schema changes in database
* MongoDB or SQL?
* AWS or Azure?
* Scala or C#?
* Considering the high cost of hosting this service and development - wait before there is considerable number of app downloads. You don't need analytics data for few hundred users. Wait until it hits at least 1000 downloads.
  * Does that also mean that for users who don't download an update, I would not get analytics data? For an app like this that could be a lot of valuable data.


#### Future Development
* Add timer on flash card screen and once all flash cards are completed show a toaster or drawer notificatin with the amount of time
* Add another option for number of flash cards as "Continuous" - that would display one letter at a time
* Create similar app for Gujarati letters
* Add sound such that users can verify or check correct pronunciation if they are not sure about the letter on flash card


#### App Store/Play Store Membership
* Create account registered from India such that you provide Jagruti's India bank account details
  * Do we have to give account details at the time of registration? - No
  * Can we change payout account later, such as at the time of withdrawal? Or keep money in Paypal account?
* Publish app to Apple App Store first followed by Google play store


#### Install Expo iOS Simulator Build
* Download latest [Expo iOS Simulator Build](http://expo.io/--/api/v2/versions/download-ios-simulator-build) and extract locally
* Start Simulator using XCode and start the device and get its UDID -  `xcrun simctl list`
* Install using `xcrun simctl install 434D6800-A8BD-4DC8-A016-8D96740A6019 /Users/girish.jain/Downloads/Exponent-2.10.0/`


#### Steps to build and publish app to App Store - [Expo Deployment Guide](https://docs.expo.io/versions/v32.0.0/distribution/app-stores/)
* iOS
  * Remove Facebook Ad test device id registration in by commenting line `FacebookAds.AdSettings.addTestDevice(FacebookAds.AdSettings.currentDeviceHash);` in `FacebookAdService.ts` file.
  * Make sure to increase version (major/minor/patch) number to get a unique build number in `app.json` file.
  * Create an iOS build using - `expo build:ios`
    * Build is generated on Expo servers and it uploads generated IPA to Amamzon S3
  * `expo upload:ios`
  * `expo publish`
  * If UI has changed and you need to capture new screenshots, locally modify `App.tsx` file and remove advertising component i.e. `<Advertising></Advertising>` line. Refer [here](https://help.apple.com/app-store-connect/#/devd274dd925) for screenshot requirements.
  * Run app and capture screenshots and once done revert changes to `App.tsx` file
* Android
  * Remove Facebook Ad test device id registration in by commenting line `FacebookAds.AdSettings.addTestDevice(FacebookAds.AdSettings.currentDeviceHash);` in `FacebookAdService.ts` file.
  * Make sure to increase version (major/minor/patch) number to get a unique build number in `app.json` file.
  * Increase `versionCode` for android
  * Create an iOS build using - `expo build:android`
    * Build is generated on Expo servers and it uploads generated IPA to Amamzon S3
  * `expo upload:android --key /Users/girish.jain/src/repos/learning/react-native/personal_misc/JJ_googlePlayServiceAccountKey.json --track production`
  * `expo publish`
  * If UI has changed and you need to capture new screenshots, locally modify `App.tsx` file and remove advertising component i.e. `<Advertising></Advertising>` line. Refer [here](https://help.apple.com/app-store-connect/#/devd274dd925) for screenshot requirements.
  * Run app and capture screenshots and once done revert changes to `App.tsx` file


#### Steps to publish to Expo
* For changes that don't need a new version of app published to AppStore you can publish these to Expo so that all user's would get it on the fly. The downside to this approach is that user's that download app for the first time will have an update already waiting for them to be installed. That's not ideal but works for trivial udpates.
* Go to [Expo DevTools](http://localhost:19002/), click on "Publish or republish project..." link in left menu options.

#### Features
* Done ==> left and right navigation buttons on flash card - user should be able to navigate between flash cards
* Done ==> sound option - user should be able to play sound for a letter
* Done ==> Audio should play even if phone is in silent mode
* Done ==> Make buttons to select number of flash cards a bit fancy
* Done ==> Increase fontSize of flash card letter to better use UI real estate available for e.g. it should have bigger font size on iPad
* Done ==> Change splash screen background color to match app home screen color
* Done ===> If user taps back button on flash card screen and an Interstitial Ad is loaded then show it
* Done ==> Add Learn and Practice sections - Learn would be all the letters sequentially and flash cards would come under practice 
* Done ==> Facebook doesn't support pre-loading interstitial, show Ad only if user has passed certain number of characters, not all. Currently it is showing ad always.
* Done ==> Publish to Android play store
* Done ==> Try Google text to speech API to generate letters
  * The output was not very convincing, decided to continue with Amazon polly
* Done ==> Hindi "mrityu"? 0943 Add "R" sound to the list of vowels, generate audio for each possible combination
  * Dropped the idea for now as it does not seem like this sound is relevant for all letters, there are many letters where this sound does not apply.
* Show phonetic pronunciation of letter as shown when you search a word on Google
* Timer - show timer on status bar and once user comes back to home screen show toaster notification
* Use custom font on iOS
* Change logo to letter a
* Use Roboto font on iOS (investigate why it's not working as expected even after importing font file)
* Ability to trace over letters
* Setting page to control default behavior of sound on flash card - whether to play as the letter is loaded or wait for user to manually play sound

##### Priority 0
* Try rectangle banner ad for larger devices such as iPad/Android tablet
* Add option for "numbers" flash cards as well
* Consonants view - dynamically adjust font size for larger devices such as iPad/Android tablets 
* Facebook native ads -  If yes, try Facebook Native Ads (it supports pre-loading as well)
  * Can native ads be interstitial (full screen)?
  * Assumption is that Native ads can yield better revenue
  * Also explore additional real state within app that can be used for serving ads
* Support swipe gestures on flash card screen to navigate between cards
* Correct audio for some letters - pa
  * Explore recording own sounds, watch for file size
* Gujarati app, sounds issue - la
* Add usage based ad functionality such that when user is completing certain levels, for e.g. 
  * completing three consonants/vowels letters sequence (more than 10 seen for each sequence)
  * any more such usage scenarios?


### Ad Revenue
* Banner Ads eCPM is lowest ($ 0.25), you need to research about showing Interstitials ($ 10) or rewarded videos ($ 25+) - You want to be very careful with implementing this feature
* As part of "Learn" section, I am removing the ad which would show up every time user completes a letter sequence. Basically, changing limit from 10 to 15 so that it won't show up for "learn" section. I would need to add some sophisticated logic that would display ads after every let's say 3 letters sequence completed by user. Would need to save usage locally and then determine whether to display ad based on that.

#### Native Base
* Run `node node_modules/native-base/ejectTheme.js` to copy over theme config and variables.

#### Tidbits
* [Expo Android App](https://expo.io/@girishjjain/hindi-letters-flashcards)
* [Hindi iOS App](https://itunes.apple.com/us/app/hindi-letters-flash-cards/id1456970084?ls=1&mt=8)
* [Hindi Android App](https://play.google.com/store/apps/details?id=com.sambhavsolutions.flashcards.hindi)
* [Gujarati Android App](https://play.google.com/store/apps/details?id=com.sambhavsolutions.flashcards.gujarati)
* [Gujarati iOS App](https://apps.apple.com/us/app/learn-gujarati-with-flash-card/id1485077211?ls=1)
* When testing app in iOS Simulator use `Cmd + d` shortcut to bring up Expo menu to reload app or enable debugging. Similarly, use `Cmd + m` on Android simulator
* Google AdMob Support (Ravi) - 1800 419 0915
* https://github.com/getstream/react-native-audio-player
* Don't forget to remove all listeners in componentWillUnmount

https://medium.com/reactnativeacademy/debugging-react-native-applications-6bff3f28c375


#### Local Development
```
cd ~/src/repos/learning/react-native/hpp/
code .
npm run build

npm install -g expo-cli
```

https://rnfirebase.io/docs/v5.x.x/installation/initial-setup
https://rnfirebase.io/docs/v5.x.x/admob/ios
https://rnfirebase.io/docs/v5.x.x/admob/reference/admob

Ad

```ts
  public componentDidMount() {
    AdMobInterstitial.addEventListener('interstitialDidLoad', () => console.log('interstitialDidLoad'));
    AdMobInterstitial.addEventListener('interstitialWillLeaveApplication', () => console.log('interstitialWillLeaveApplication'));
    AdMobInterstitial.addEventListener('interstitialDidFailToLoad', (event) => console.log(`interstitialDidFailToLoad fired: ${event}`));
  }

  public componentWillUnmount() {
    AdMobInterstitial.removeAllListeners();
  }

```

Expo PR that fixes issue with AdMob Interstitial Ads (Verify with expo snack for AdMob - https://snack.expo.io/@thetc/admob-example)
https://github.com/expo/expo/pull/4099


┌────────────────────────────────────────────────────────────────────────────────────────────┐
│ NativeBase 2.0 has been succesfully installed!                                             │
│ Run `node node_modules/native-base/ejectTheme.js` to copy over theme config and variables. │
│ Head over to the docs for detailed information on how to make changes to the theme.        │
└────────────────────────────────────────────────────────────────────────────────────────────┘


### Facebook Ad Integration
* https://business.facebook.com/pub/home?business_id=414783132580607
* User: jagrutigjain@gmail.com
* iOS Banner Ad placement Id - 669088660182224_669091330181957
* Android Banner Ad placement Id - 669088660182224_720305865060503
* iOS Interstitial Ad placement Id - 669088660182224_719935811764175
* Android Interstitial Ad placement Id - 669088660182224_720308661726890
* App Id - 334918194084740
* App display name - Hindi Letters Flash Cards
* [Expo Facebook integration issue](https://github.com/expo/expo/issues/5028)
  * Facebook Error:
  ```
  error Z {
    "_dispatchInstances": FiberNode {
      "tag": 5,
      "key": null,
      "type": "ViewManagerAdapter_CTKBannerView",
    },
    "_dispatchListeners": [Function onError],
    "_targetInst": FiberNode {
      "tag": 5,
      "key": null,
      "type": "ViewManagerAdapter_CTKBannerView",
    },
    "bubbles": undefined,
    "cancelable": undefined,
    "currentTarget": 107,
    "defaultPrevented": undefined,
    "dispatchConfig": Object {
      "registrationName": "onAdError",
    },
    "eventPhase": undefined,
    "isDefaultPrevented": [Function K],
    "isPropagationStopped": [Function K],
    "isTrusted": undefined,
    "nativeEvent": Object {
      "message": "Error Domain=com.facebook.ads.sdk Code=1012 \"\" UserInfo={NSLocalizedDescription=, FBAdErrorDetailKey={
      msg = \"The SDK version in the ad request is no longer supported for new apps. Please upgrade to one of the latest versions of the SDK\";
  }}",
      "target": 107,
      "userInfo": Object {
        "FBAdErrorDetailKey": Object {
          "msg": "The SDK version in the ad request is no longer supported for new apps. Please upgrade to one of the latest versions of the SDK",
        },
        "NSLocalizedDescription": "",
      },
    },
    "target": 107,
    "timeStamp": 1564115030872,
    "type": undefined,
  }
  ```

* Aug 24, 2019
  * Can't depend on Expo to fix the issue related to Facebook ad integration, no updates from them on the [GitHub issue](https://github.com/expo/expo/issues/5028)
  * Need to go for bare workflow, which as of today would eject to ExpoKit project (or alternatively, I could start with a clean bare workflow project and then copy over all files to this new completely bare project, if I wanted to get rid of ExpoKit).
    * Gettting rid of ExpoKit means no more over the air updates - user's won't get latest changes automatically but will have to manually install those.
    * I don't think it's a big limitation because:
      * New features aren't make-it or brake-it features
      * Eventually users would get latest update at some point of time if they're really using the app
  * Anything else that Expo is providing today that I would lose by going bare?
    * Build and publishing - I would have to learn it, not a big factor
  * Also, going for ExpoKit based project means not being able to use over the air updates (becuase I would be using native code)


* Sep 7, 2019
    * Eject Log
  ```
  ┌────────────────────────────────────────────────────────────────────────────────────────────┐
│ NativeBase 2.0 has been succesfully installed!                                             │
│ Run `node node_modules/native-base/ejectTheme.js` to copy over theme config and variables. │
│ Head over to the docs for detailed information on how to make changes to the theme.        │
└────────────────────────────────────────────────────────────────────────────────────────────┘

> react-native-unimodules@0.5.4 postinstall /Users/girish.jain/src/repos/learning/react-native/hpp_ejected/node_modules/react-native-unimodules
> node ./scripts/postinstall.js


Successfully installed react-native-unimodules. This package contains core unimodules that are commonly depended on by other unimodules. You will need to configure your project before using other unimodules like expo-camera, expo-media-library and others.
See configuration guide:
  https://www.npmjs.com/package/react-native-unimodules/v/0.5.4

added 968 packages from 572 contributors and audited 35699 packages in 26.134s
found 35 vulnerabilities (11 low, 1 moderate, 23 high)
  run `npm audit fix` to fix them, or `npm audit` for details


Ejected successfully!

Before running your app on iOS, make sure you have CocoaPods installed and initialize the project:

  cd ios
  pod install

Then you can run the project:

  npm run android
  npm run ios

Warning: your app includes 1 package that requires additional setup. See the following URL for instructions.
Your app may not build/run until the additional setup for this package has been completed.

- expo-ads-admob: https://github.com/expo/expo/tree/master/packages/expo-ads-admob


* Sep 15, 2019
  * New react-native app
  ```
    Run instructions for iOS:
      • cd HindiApp && react-native run-ios
      - or -
      • Open HindiApp/ios/HindiApp.xcworkspace in Xcode or run "xed -b ios"
      • Hit the Run button

    Run instructions for Android:
      • Have an Android emulator running (quickest way to get started), or a device connected.
      • cd HindiApp && react-native run-android
  ```

#### How to handle pre-loading of Facebook interstitial Ad
* Facebook provides native Ads that can be pre-loaded. Try to build a solution around that.
* Until then, change the logic to accomodate for it.


#### Other languages
* Working on Gujarati as the next language
  * Publish another language as a branch or copy the souce code into another directory altogether?
  * Branch approach
    * Easy to work with as long as there are no customizations
    * Can always go from branch to separate code base
    * Risk of manual errors with merge conflicts
  * Separate directory approach
    * Manually apply patches to each different language directory is a disadvantage
    * Greater flexibility in customizations

## Expo SDK 36 Upgrade
* The following packages were not updated. You should check the READMEs for those repositories to determine what version is compatible with your new set of packages:
native-base, react-navigation, @types/expo, @types/expo__vector-icons, @types/react, @types/react-dom, @types/react-native, @types/react-navigation, concurrently, rimraf, tslint, typescript

## Dec 11, 2019
* App Store email warn
```
ITMS-90809: Deprecated API Usage - Apple will stop accepting submissions of apps that use UIWebView APIs . See https://developer.apple.com/documentation/uikit/uiwebview for more information.
```
* Google play rejected update asking to review target audience as "13 and under".
  * Updating the target audience, it gave error
  ```
  You must remove the request for location permissions from your app if your target audience only includes children under 13
  ```
