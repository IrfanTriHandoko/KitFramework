Pod::Spec.new do |s|
s.name         = "GITSFramework"
s.version      = "0.0.3"
s.summary      = "A short description of swift-ios-framework."
s.homepage     = "https://source.gits.id/RnD/swift-ios-framework"
s.license      = "MIT (ios)"
s.author             = { "GITS Indonesia" => "yatnosudar@gits.co.id" }
s.source       = { :git => "https://source.gits.id/RnD/swift-ios-framework.git", :tag => "#{s.version}" }
s.source_files  = "GITSFramework/Classes/**/*.{h,m,swift}"
s.resource_bundles = {'GITSFramework' => ['GITSFramework/Assets/**/*.{storyboard,xib,xcassets,json,imageset,png,plist}']}
s.resource = 'GITSFramework/Assets/**'
s.platform         = :ios, "9.0"
s.dependency 'GITSNetwork'
s.dependency 'SwiftyJSON', '~>4.2.0'
s.dependency 'SwiftMessages'
s.dependency 'SDWebImage', '~>4.4.6'
s.dependency 'SDWebImage/GIF', '~>4.4.6'
s.dependency 'HexColors'
s.dependency 'UIViewController+KeyboardAnimation'
s.dependency 'ChameleonFramework/Swift', '~2.2.0'
s.dependency 'IQKeyboardManager'
s.dependency 'UIImageView-Letters'

end
