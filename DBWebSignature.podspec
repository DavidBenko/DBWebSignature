Pod::Spec.new do |s|
  s.name         = 'DBWebSignature'
  s.version      = '1.0.3'
  s.summary      = 'A JSON Web Token / JSON Web Signature implementation in Objective-C.'
  s.homepage     = 'https://github.com/DavidBenko/DBWebSignature'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'David Benko' => 'dbenko@prndl.us' }
  s.source       = { :git => 'https://github.com/DavidBenko/DBWebSignature.git' }
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'
  s.source_files = 'JWT/**/*.{h,m}'
  s.requires_arc = true

end
