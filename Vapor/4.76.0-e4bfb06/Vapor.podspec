Pod::Spec.new do |spec|
  spec.name = "Vapor"
  spec.version = "4.76.0"

  spec.summary = "A server-side Swift HTTP web framework."
  spec.homepage = "https://github.com/vapor/vapor"
  spec.author = "Vapor"
  spec.license = { :type => "MIT", :file => "LICENSE" }

  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "10.15"

  spec.swift_versions = "5.4"

  spec.source = { :git => "https://github.com/VaslD/Vapor.git", :tag => "4.76.0-e4bfb06" }
  spec.source_files = "Sources/#{spec.name}/**/*.swift"
  spec.prepare_command = <<-BASH
    sed -i -e 's/Bundle\\.module/Bundle\\(for: Self\\.self\\)/' 'Tests/VaporTests/ServerTests.swift'
    mv Tests/VaporTests/Utilities/*.swift Tests/VaporTests/
    mv Tests/VaporTests/Utilities/expired.* Tests/VaporTests/
    BASH

  spec.dependency "CVaporBcrypt", "4.76.0-e4bfb06"
  spec.dependency "CVaporURLParser", "4.76.0-e4bfb06"

  spec.dependency "AsyncHTTPClient", "~> 1.10"
  spec.dependency "AsyncKit", "~> 1.0"
  spec.dependency "ConsoleKit", "~> 4.0"
  spec.dependency "Logging", "~> 1.0"
  spec.dependency "NIO", "~> 2.42"
  spec.dependency "NIOConcurrencyHelpers", "~> 2.42"
  spec.dependency "NIOCore", "~> 2.42"
  spec.dependency "NIOExtras", "~> 1.0"
  spec.dependency "NIOFoundationCompat", "~> 2.42"
  spec.dependency "NIOHTTPCompression", "~> 1.0"
  spec.dependency "NIOHTTP1", "~> 2.42"
  spec.dependency "NIOHTTP2", "~> 1.20"
  spec.dependency "NIOSSL", "~> 2.8"
  spec.dependency "Algorithms", "~> 1.0"
  spec.dependency "RoutingKit", "~> 4.5"
  spec.dependency "MultipartKit", "~> 4.2"

  spec.test_spec "VaporTests" do |test|
    test.source_files = "Tests/VaporTests/**/*.swift"
    test.resources = [
      "Tests/VaporTests/Utilities",
      "Tests/VaporTests/expired.crt",
      "Tests/VaporTests/expired.key",
    ]

    test.dependency "XCTVapor", "#{spec.version}"

    test.dependency "NIOTestUtils", "~> 2.42"
  end

  spec.test_spec "AsyncTests" do |test|
    test.source_files = "Tests/AsyncTests/**/*.swift"

    test.dependency "XCTVapor", "#{spec.version}"

    test.dependency "NIOTestUtils", "~> 2.42"
  end
end
