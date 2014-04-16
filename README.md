* Create Project

CocoaPods Integration
http://guides.cocoapods.org/using/getting-started.html

* Navigate to project directory (ex. myproject/)
* To install cocoapods, run command:
    sudo gem install cocoapods
    * Enter User Password
* To start pods setup, run command:
    pod setup
* To create a Podfile, run command:
    touch Podfile
* Edit Podfile with what you want (emacs, vim, etc.)
    vim Podfile
    * Add this line to Podfile
        plaftform :ios, '7.0'
* Edit podfile to include project dependencies
    http://guides.cocoapods.org/syntax/podfile.html
* To install dependencies, run commond:
    pod install
* From now on use `YourProject.xcworkspace` instead of `YourProject`.xcodeproj`
* Close `YourProject.xcodeproj` and open `YourProject.xcworkspace`

AFNetworking Integration
https://github.com/AFNetworking/AFNetworking/wiki/Getting-Started-with-AFNetworking
* Set up CocoaPods from above instructions
* Navigate to project dir
* Edit Podfile how you want (I use vim)
    vim Podfile
    * Add this line to your podfile
        pod 'AFNetworking', '~> 2.0'
* To install AFNetworking, run command:
    pod install

Facebook Integration
https://github.com/facebook/facebook-ios-sdk
* Set up CocoaPods from above instructions
* Navigate to project dir
* Edit Podfile
    vim Podfile
    * Add this line to your podfile
        pod 'Facebook-iOS-SDK', '3.9.0'
* To install the Facebook SDK, run command:
    pod install
* Obtain Facebook App ID
    * Go to https://developers.facebook.com/apps
        * Click "+ Create a New App"
            * Fill in Form -> click submit
        * After submission, should see App ID
* Configure .plist
    * Find .plist under YourProject/Supporting\ Files/YourProject-Test.plist
    * Right click row 'Information Property List' and select 'Add Row'
    Reference Image: http://bit.ly/1i7B4iK
        * Title that key 'FacebookAppID'
            * Add your App ID as the value from your FB App Dashboard
        * Add another key and title it 'FacebookDisplayName'
            * Add your Display Name as the value from your FB App Dashboard
        * Add another key as an array and title it 'URL types'
            * Under sub-item called 'Item 0' add 'URL Schemes' as URL identifier
                * Set 'Item 0' value as FB App ID with prefix "fb" (ex. "fb12334494390580")
* Add FB login to app
https://developers.facebook.com/docs/ios/login-tutorial/
    * Create Login View
    * Import Facebook in your login ViewController
        #import <FacebookSDK/FacebookSDK.h>"
    * Create FB Login Button inside ViewController, add this code in ViewDidLoad()
        FBLoginView loginView *loginView = [[FBLoginView alloc] init];
        [self.view addSubview:loginView];

