Pod::Spec.new do |spec|
spec.name         = "ALProgressRing"
spec.version      = "1.0.0"
spec.summary      = "Animated and fully customizable progress ring with gradient"

spec.homepage     = "https://github.com/alxrguz/ALProgressRing"
spec.source       = { :git => "https://github.com/alxrguz/ALProgressRing.git", :tag => "#{spec.version}" }
spec.license      = { :type => "MIT", :file => "LICENSE" }

spec.author       = { "Alexandr Guzenko" => "alxrguz@icloud.com" }

spec.platform     = :ios
spec.ios.framework = 'UIKit'
spec.swift_version = ['4.2', '5.0']
spec.ios.deployment_target = "10.0"

spec.source_files  = "Sources/ALProgressRing/**/*.swift"

end