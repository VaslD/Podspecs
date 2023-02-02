Pod::Spec.new do |spec|
  spec.name = "Pulse"
  spec.version = "3.3.0-backport"

  spec.summary = "Pulse: Network Logger for Apple Platforms"
  spec.homepage = "https://kean.blog/pulse/home"
  spec.documentation_url = "https://kean-docs.github.io/pulse/documentation/pulse/"
  spec.author = "Alexander Grebenyuk"
  spec.license = { :type => "MIT", :file => "LICENSE" }

  spec.ios.deployment_target = "13.0"

  spec.swift_versions = "5.6"

  spec.source = { :git => "https://github.com/kean/Pulse.git", :tag => "3.3.0" }
  spec.source_files = "Sources/#{spec.name}/**/*.swift"
  spec.prepare_command = <<-BASH
    sed -i -e '8s/SwiftUI/AppStorage/' 'Sources/#{spec.name}/RemoteLogger/RemoteLogger.swift'
    sed -i -e '43s/AppStorage/AppStorageCompat/' 'Sources/#{spec.name}/RemoteLogger/RemoteLogger.swift'
    sed -i -e '45s/AppStorage/AppStorageCompat/' 'Sources/#{spec.name}/RemoteLogger/RemoteLogger.swift'
    BASH

  spec.dependency "AppStorage", "~> 1.0.4"

  spec.test_spec "#{spec.name}Tests" do |test|
    test.source_files = "Tests/#{spec.name}Tests/**/*.swift"
  end
end
