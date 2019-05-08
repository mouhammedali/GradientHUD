#
# Be sure to run `pod lib lint GradientHUD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GradientHUD'
  s.version          = '0.1.0'
  s.summary          = 'Colorful Loading HUD'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Gradient HUD, to provide more interesting loading screens
                       DESC

  s.homepage         = 'https://github.com/mouhammedali/GradientHUD'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mouhammedali' => 'mouhammedaliamer@gmail.com' }
  s.source           = { :git => 'https://github.com/mouhammedali/GradientHUD.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_version = '4.0'
  s.ios.deployment_target = '9.0'
  s.source_files =  'Classes/*.{swift}'
  s.ios.frameworks = 'UIKit', 'Foundation'

end
