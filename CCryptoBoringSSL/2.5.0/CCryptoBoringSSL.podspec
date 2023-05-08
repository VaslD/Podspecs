Pod::Spec.new do |spec|
  spec.name = "CCryptoBoringSSL"
  spec.version = "2.5.0"

  spec.summary = "Open-source implementation of a substantial portion of the API of Apple CryptoKit suitable for use on Linux platforms."
  spec.homepage = "https://github.com/apple/swift-crypto"
  spec.documentation_url = "https://developer.apple.com/documentation/cryptokit"
  spec.author = "Apple Inc."
  spec.license = { :type => "Apache 2.0", :file => "LICENSE.txt" }

  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "10.15"

  spec.swift_version = "5.6"

  spec.source = { :git => "https://github.com/apple/swift-crypto.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/#{spec.name}/**/*.{h,c,S}"
  spec.exclude_files = [
    "Sources/#{spec.name}/crypto/bio/connect.c",
    "Sources/#{spec.name}/crypto/bio/socket_helper.c",
    "Sources/#{spec.name}/crypto/bio/socket.c",
  ]
  spec.public_header_files = "Sources/#{spec.name}/include/*.h"
  spec.prepare_command = <<-BASH
    sed -i -e '129d' 'Sources/#{spec.name}/include/CCryptoBoringSSL_bn.h'
    sed -i -e '58i\\\n#include <inttypes.h>\n' 'Sources/#{spec.name}/crypto/x509/t_x509.c'
    BASH
  spec.pod_target_xcconfig = {
    "OTHER_CFLAGS" => "$(inherited) -DWIN32_LEAN_AND_MEAN",
  }
  spec.module_map = false
end
