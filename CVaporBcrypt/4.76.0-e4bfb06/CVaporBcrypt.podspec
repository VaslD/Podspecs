Pod::Spec.new do |spec|
  spec.name = "CVaporBcrypt"
  spec.version = "4.76.0"

  spec.summary = "A server-side Swift HTTP web framework."
  spec.homepage = "https://github.com/vapor/vapor"
  spec.author = "Vapor"
  spec.license = { :type => "MIT", :file => "LICENSE" }

  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "10.15"

  spec.swift_versions = "5.4"

  spec.source = { :git => "https://github.com/VaslD/Vapor.git", :tag => "4.76.0-e4bfb06" }
  spec.source_files = "Sources/#{spec.name}/**/*.{h,c}"
  spec.public_header_files = "Sources/#{spec.name}/**/bcrypt.h"
end
