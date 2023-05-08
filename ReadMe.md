# Podspecs

`source "https://github.com/VaslD/Podspecs.git"`

Test cases are included as test specs.

## Apple & Swift on Server

- `pod "Algorithms"`
- `pod "APNSwift"`
- `pod "ArgumentParser"`
- `pod "AsyncHTTPClient"` (`CAsyncHTTPClient`)
- `pod "Atomics"`
- `pod "Backtrace"` (`CBacktrace`)
- `pod "Collections"` (`DequeModule`, `OrderedCollections`)
- `pod "Crypto"` (`CCryptoBoringSSL`)
- `pod "IsPower"`, `import SE0288_IsPower`
- `pod "Logging"`
- `pod "Markdown"` (`CMarkGFM`, `CMarkGFMExtensions`)
- `pod "Metrics"` (`CoreMetrics`, `MetricsTestKit`)
- `pod "MQTTNIO"`
- `pod "NIO"` (`NIOCore`, `NIOEmbedded`, `NIOPOSIX`, `NIOHTTP1`, `NIOTLS`, `NIOWebSocket`)
- `pod "NIOExtras"` (`NIOHTTPCompression`, `NIOSOCKS`)
- `pod "NIOHTTP2"` (`NIOHPACK`)
- `pod "NIOSSH"`
- `pod "NIOSSL"` (`CNIOBoringSSL`)
- `pod "NIOTransportServices"`
- `pod "Numerics"` (`RealModule`, `ComplexModule`)
- `pod "RangeSet"`, `import SE0270_RangeSet`
- `pod "RedisStack"` (`RedisTypes`)
- `pod "ServiceDiscovery"`
- `pod "StructuredFieldValues"` (`RawStructuredFieldValues`)
- `pod "SwiftASN1"`
- `pod "SwiftProtobuf"`
- `pod "SwiftSyntax"` (`SwiftSyntaxBuilder`, `SwiftSyntaxParser`)
- `pod "SymbolKit"`
- `pod "System"`, `import SystemPackage`

## Vapor

- `pod "AsyncKit"`
- `pod "ConsoleKit"`
- `pod "JWTKit"` (`CJWTKitBoringSSL`)
- `pod "MultipartKit"`
- `pod "MySQLKit"`
- `pod "Redis"`
- `pod "RoutingKit"`
- `pod "SQLKit"`
- `pod "Vapor"` (`CVaporBcrypt`, `CVaporURLParser`)
- `pod "WebSocketKit"`

## Kitura

- `pod "BlueSocket"`, `import Socket`
- `pod "BlueSSLService"`, `import SSLService`
- `pod "Kitura"`
- `pod "KituraNIO"`, `import KituraNet`

## Nuke

- `pod "Nuke"`
- `pod "NukeExtensions"`
- `pod "NukeUI"`

Nuke is also distributed as precompiled binary frameworks:

- `pod "Nuke.xcframework"`
  - `import Nuke`
  - `import NukeUI`
  - `import NukeExtensions`


## Pulse

- `pod "Pulse"`
- `pod "PulseLogHandler"`
- `pod "PulseUI"`

Pulse is also distributed as precompiled binary frameworks:

- `pod "Pulse.xcframework"`
  - `import Pulse`
  - `import PulseUI`


For iOS 13, macOS 11, tvOS 13, and watchOS 7, use Pulse 2:

- `pod "Pulse", "~> 2.0"`
- `pod "PulseUI", "~> 2.0"`
