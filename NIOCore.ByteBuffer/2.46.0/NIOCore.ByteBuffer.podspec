Pod::Spec.new do |spec|
  spec.name = "NIOCore.ByteBuffer"
  spec.version = "2.46.0"

  spec.summary = "Event-driven network application framework for high performance protocol servers & clients, non-blocking."
  spec.homepage = "https://github.com/apple/swift-nio"
  spec.author = "Apple Inc."
  spec.license = { :type => "Apache 2.0", :file => "LICENSE.txt" }

  spec.module_name = "NIOCore"

  spec.ios.deployment_target = "10.0"
  spec.osx.deployment_target = "10.10"

  spec.swift_version = "5.5"

  spec.source = { :git => "https://github.com/apple/swift-nio.git", :tag => "#{spec.version}" }
  spec.source_files = [
    "Sources/#{spec.module_name}/ByteBuffer-*.swift",
    "Sources/#{spec.module_name}/CircularBuffer.swift",
    "Sources/#{spec.module_name}/MarkedCircularBuffer.swift",
    "Sources/#{spec.module_name}/Integer*.swift",
    "Sources/#{spec.module_name}/NIOSendable.swift",
    "Sources/#{spec.module_name}/PointerHelpers.swift",
    "Sources/#{spec.module_name}/RecvByteBufferAllocator.swift",
    "Sources/#{spec.module_name}/Utilities.swift",

    "Sources/NIOFoundationCompat/**/*.swift",
  ]
  spec.prepare_command = <<-BASH
    sed -i -e '14,35d;48,204d' 'Sources/#{spec.module_name}/Utilities.swift'

    sed -i -e '18d' 'Tests/#{spec.module_name}Tests/ByteBufferTest.swift'
    sed -i -e '18,31d;45,78d' 'Tests/#{spec.module_name}Tests/XCTest+Extensions.swift'

    sed -i -e '17d' 'Tests/NIOFoundationCompatTests/ByteBuffer+UUIDTests.swift'
    sed -i -e '18d' 'Tests/NIOFoundationCompatTests/ByteBufferDataProtocolTests.swift'
    sed -i -e '18d' 'Tests/NIOFoundationCompatTests/ByteBufferView+MutableDataProtocolTest.swift'
    sed -i -e '18d' 'Tests/NIOFoundationCompatTests/Codable+ByteBufferTest.swift'
    sed -i -e '18d' 'Tests/NIOFoundationCompatTests/JSONSerialization+ByteBufferTest.swift'
    BASH

  spec.test_spec "#{spec.module_name}Tests" do |test|
    test.source_files = [
      "Tests/#{spec.module_name}Tests/ByteBuffer*.swift",
      "Tests/#{spec.module_name}Tests/Integer*.swift",
      "Tests/#{spec.module_name}Tests/MarkedCircularBuffer*.swift",
      "Tests/#{spec.module_name}Tests/RecvByteBufferAllocator*.swift",
      "Tests/#{spec.module_name}Tests/XCTest+Extensions.swift",

      "Tests/NIOFoundationCompatTests/**/*.swift",
    ]
  end
end
