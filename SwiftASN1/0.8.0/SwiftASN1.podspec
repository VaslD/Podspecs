Pod::Spec.new do |spec|
  spec.name = "SwiftASN1"
  spec.version = "0.8.0"

  spec.summary = "An implementation of ASN.1 types and DER serialization."
  spec.homepage = "https://github.com/apple/swift-asn1"
  spec.documentation_url = "https://swiftpackageindex.com/apple/swift-asn1/0.8.0/documentation/swiftasn1"
  spec.author = "Apple Inc."
  spec.license = { :type => "Apache 2.0", :file => "LICENSE.txt" }

  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "10.15"

  spec.swift_version = "5.7"

  spec.source = { :git => "https://github.com/apple/swift-asn1.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/#{spec.name}/**/*.swift"

  spec.test_spec "#{spec.name}Tests" do |test|
    test.source_files = "Tests/#{spec.name}Tests/**/*.swift"
  end
end
