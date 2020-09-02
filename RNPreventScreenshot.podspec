
Pod::Spec.new do |s|
  s.name         = "RNPreventScreenshot"
  s.version      = "1.0.0"
  s.summary      = "RNPreventScreenshot"
  s.description  = "RNPreventScreenshot"
  s.homepage     = "https://github.com/STIENLILLY/react-native-prevent-screenshot"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "webh4ck@naver.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/STIENLILLY/react-native-prevent-screenshot.git", :tag => "master" }
  s.source_files  = "ios/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  