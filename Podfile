source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.2'
use_frameworks!
inhibit_all_warnings!
target 'NewTelegraph', :exclusive => true do
    pod 'SnapKit'
    pod 'Alamofire', '~> 3.2.0'
    pod 'SwiftyJSON'
    pod 'SwiftLoader'
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

