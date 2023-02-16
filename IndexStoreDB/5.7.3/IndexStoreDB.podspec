Pod::Spec.new do |spec|
  spec.name = "IndexStoreDB"
  spec.version = "5.7.3"

  spec.summary = "Index database library for use with SourceKit-LSP."
  spec.homepage = "https://github.com/apple/indexstore-db"
  spec.author = "Apple Inc."
  spec.license = { :type => "Apache 2.0", :file => "LICENSE.txt" }

  spec.osx.deployment_target = "10.13"

  spec.source = { :git => "https://github.com/apple/indexstore-db.git", :tag => "swift-5.7.3-RELEASE" }
  spec.source_files = "Sources/#{spec.name}/**/*.swift"

  spec.dependency "CIndexStoreDB", "#{spec.version}"
end
