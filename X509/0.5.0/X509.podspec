Pod::Spec.new do |spec|
  spec.name = "X509"
  spec.version = "0.5.0"

  spec.summary = "A library for working with X.509 certificates."
  spec.homepage = "https://github.com/apple/swift-certificates"
  spec.documentation_url = "https://swiftpackageindex.com/apple/swift-certificates/0.5.0/documentation/x509"
  spec.author = "Apple Inc."
  spec.license = { :type => "Apache 2.0", :file => "LICENSE.txt" }

  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "10.15"

  spec.swift_version = "5.7"

  spec.source = { :git => "https://github.com/apple/swift-certificates.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/#{spec.name}/**/*.swift"
  spec.prepare_command = <<-BASH
    sed -i -e 's/Bundle\\.module/Bundle\\(for: Self\\.self\\)/' 'Tests/#{spec.name}Tests/OCSPPolicyVerifierTests.swift'
    sed -i -e 's/Bundle\\.module/Bundle\\(for: Self\\.self\\)/' 'Tests/#{spec.name}Tests/PEMTests.swift'
    BASH

  spec.dependency "Crypto", "~> 2.5"
  spec.dependency "_CryptoExtras", "~> 2.5"
  spec.dependency "SwiftASN1", "~> 0.8.0"

  spec.test_spec "#{spec.name}Tests" do |test|
    test.source_files = "Tests/#{spec.name}Tests/**/*.swift"
    test.resources = [
      "Tests/#{spec.name}Tests/OCSP Test Resources/**/*",
      "Tests/#{spec.name}Tests/CSR Vectors/**/*",
      "Tests/#{spec.name}Tests/*.pem",
    ]
  end
end
