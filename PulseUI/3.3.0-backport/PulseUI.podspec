Pod::Spec.new do |spec|
  spec.name = "PulseUI"
  spec.version = "3.3.0-backport"

  spec.summary = "Pulse: Network Logger for Apple Platforms"
  spec.homepage = "https://kean.blog/pulse/home"
  spec.documentation_url = "https://kean-docs.github.io/pulseui/documentation/pulseui/"
  spec.author = "Alexander Grebenyuk"
  spec.license = { :type => "MIT", :file => "LICENSE" }

  spec.ios.deployment_target = "13.0"

  spec.swift_versions = "5.6"

  spec.source = { :git => "https://github.com/kean/Pulse.git", :tag => "3.3.0" }
  spec.source_files = "Sources/#{spec.name}/**/*.swift"
  spec.exclude_files = [
    "Sources/#{spec.name}/**/*-macos.swift",
    "Sources/#{spec.name}/**/*-tvos.swift",
    "Sources/#{spec.name}/**/*-watchos.swift",
  ]
  spec.prepare_command = <<-BASH
    find 'Sources/#{spec.name}' -type f -name '*.swift' -exec perl -i -p -e 's/^(public |private )?(final )?(class |struct |extension |func |enum |let )/\\@available(iOS 14, *)\\n\\1\\2\\3/' {} \\;
    BASH

  spec.dependency "Pulse", "#{spec.version}"

  spec.test_spec "#{spec.name}Tests" do |test|
    test.source_files = "Tests/#{spec.name}Tests/**/*.swift"
  end
end
