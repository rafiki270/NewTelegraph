source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.2'
use_frameworks!
inhibit_all_warnings!
target 'NewTelegraph', :exclusive => true do
    pod 'SnapKit', '~> 0.19.1'
    pod 'Alamofire', '~> 3.2.0'
    pod 'SwiftyJSON', '~> 2.3.2'
    pod 'SwiftSpinner', '~> 0.8.0'
end


def testing_pods
    pod 'Quick', '~> 0.9.0'
    pod 'Nimble', '3.0.0'
end

target 'NewTelegraphTests' do
    testing_pods
end

target 'NewTelegraphUITests' do
    testing_pods
end

