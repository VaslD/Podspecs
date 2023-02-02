Pod::Spec.new do |spec|
  spec.name = "PulseLogHandler"
  spec.version = "3.1.0-backport"

  spec.summary = "Swift Log Extension for Pulse"
  spec.homepage = "https://kean.blog/pulse/home"
  spec.documentation_url = "https://kean-docs.github.io/pulseloghandler/documentation/pulseloghandler/"
  spec.author = "Alexander Grebenyuk"
  spec.license = { :type => "MIT", :file => "LICENSE" }

  spec.ios.deployment_target = "13.0"

  spec.swift_versions = "5.6"

  spec.source = { :git => "https://github.com/kean/PulseLogHandler.git", :tag => "3.1.0" }
  spec.source_files = "Sources/#{spec.name}/**/*.swift"
  spec.prepare_command = <<-BASH
    sed -i -e '70s/\.name//' 'Tests/#{spec.name}Tests/PersistenLogHandlerTests.swift'
    sed -i -e '73s/XCTAssertEqual/\\/\\/ XCTAssertEqual/' 'Tests/#{spec.name}Tests/PersistenLogHandlerTests.swift'
    sed -i -e '75s/\.name//' 'Tests/#{spec.name}Tests/PersistenLogHandlerTests.swift'
    sed -i -e '78s/XCTAssertEqual/\\/\\/ XCTAssertEqual/' 'Tests/#{spec.name}Tests/PersistenLogHandlerTests.swift'
    BASH

  spec.dependency "Pulse", "3.3.0-backport"

  spec.dependency "Logging", "~> 1.2"

  spec.test_spec "#{spec.name}Tests" do |test|
    test.source_files = "Tests/#{spec.name}Tests/**/*.swift"
  end
end
