Pod::Spec.new do |spec|
  spec.name = "Atomics"
  spec.version = "1.0.3"

  spec.summary = "Low-level atomic operations for Swift."
  spec.homepage = "https://github.com/apple/swift-atomics"
  spec.author = "Apple Inc."
  spec.license = { :type => "Apache 2.0", :file => "LICENSE.txt" }

  spec.ios.deployment_target = "10.0"
  spec.osx.deployment_target = "10.10"

  spec.swift_version = "5.6"

  spec.source = { :git => "https://github.com/apple/swift-atomics.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/#{spec.name}/**/*.swift"

  spec.dependency "_AtomicsShims", "#{spec.version}"

  spec.test_spec "#{spec.name}Tests" do |test|
    test.source_files = "Tests/#{spec.name}Tests/**/*.swift"
    test.exclude_files = "Tests/#{spec.name}Tests/main.swift"
  end
end
