Pod::Spec.new do |spec|
  spec.name = "CIndexStoreDB"
  spec.version = "5.7.3"

  spec.summary = "Index database library for use with SourceKit-LSP."
  spec.homepage = "https://github.com/apple/indexstore-db"
  spec.author = "Apple Inc."
  spec.license = { :type => "Apache 2.0", :file => "LICENSE.txt" }

  spec.osx.deployment_target = "10.13"

  spec.source = { :git => "https://github.com/apple/indexstore-db.git", :tag => "swift-5.7.3-RELEASE" }
  spec.prepare_command = <<-BASH
    cp "include/indexstore/indexstore_functions.h" "include/CIndexStoreDB/indexstore_functions.h"
    sed -i -e '16s/.*/#include "indexstore_functions.h"/' "include/CIndexStoreDB/CIndexStoreDB.h"
    BASH
  spec.source_files = [
    # Headers
    "include/CIndexStoreDB/indexstore_functions.h",
    "include/CIndexStoreDB/CIndexStoreDB.h",

    # Sources
    "lib/CIndexStoreDB/**/*.cpp",
    "lib/Index/**/*.cpp",
    "lib/Database/**/*.{c,cpp}",
    "lib/Core/**/*.cpp",
    "lib/Support/**/*.{cpp,mm}",
    "lib/LLVMSupport/**/*.cpp",
  ]
  spec.preserve_path = [
    # IndexStoreDB_CIndexStoreDB
    "include/CIndexStoreDB/**/*.h",

    # IndexStoreDB_Index
    "lib/Index/**/*.{h,def}",
    "include/indexstore/**/*.h",

    # IndexStoreDB_Database
    "lib/Database/**/*.h",

    # IndexStoreDB_Support
    "lib/Support/**/*.h",
    "include/IndexStoreDB/**/*.h",

    # IndexStoreDB_LLVMSupport
    "lib/LLVMSupport/**/*.{h,inc}",
    "include/llvm/**/*.{h,def}",
    "include/llvm-c/**/*.{h,def}",
  ]

  spec.pod_target_xcconfig = {
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
    "HEADER_SEARCH_PATHS" => "$(inherited) $(PODS_TARGET_SRCROOT)/include",
    "OTHER_CFLAGS" => "$(inherited) -DMDB_USE_POSIX_MUTEX=1 -DMDB_USE_ROBUST=0",
  }

  spec.libraries = "c++"
  spec.frameworks = "Foundation"
end
