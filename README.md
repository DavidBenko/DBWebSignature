# JSON Web Token (JWT) / JSON Web Signature (JWS) 

JWT/JWS for iOS. Creates and Validates signatures for JSON Objects.

[JSON Web Token]: http://self-issued.info/docs/draft-ietf-oauth-json-web-token.html

Thanks to [yourkarma](https://github.com/yourkarma/JWT) for the original implementation. Unfortunatley, I found this version did not adhere correctly to the spec document, and also had unnecessary dependencies, this version should adhere to the spec and provide an easier interface for creating and validating JWT/JWS.

# Installation

Add the following to your [Cocoapods][] Podfile:

    pod 'JWT', git: 'https://github.com/DavidBenko/JWT.git', tag: '1.0.0'

[Cocoapods]: http://cocoapods.org

# Usage

You can encode arbitrary payloads like so:

    [JWT encodePayload:@{@"foo": @"bar"} withSecret:@"secret"];

If you're using reserved claim names you can encode your claim set like so (all properties are optional):

    JWTClaimsSet *claimsSet = [[JWTClaimsSet alloc] init];
    claimsSet.issuer = @"Facebook";
    claimsSet.subject = @"Token";
    claimsSet.audience = @"http://yourkarma.com";
    claimsSet.expirationDate = [NSDate distantFuture];
    claimsSet.notBeforeDate = [NSDate distantPast];
    claimsSet.issuedAt = [NSDate date];
    claimsSet.identifier = @"thisisunique";
    claimsSet.type = @"test";
    [JWT encodeClaimsSet:claimsSet withSecret:@"secret"];

# Algorithms

### Supported Algorithms
- HS512 (HMAC, SHA-512)
- HS256 (HMAC, SHA-256)

Additional algorithms can be added by implementing the `KWTAlgorithm` protocol.
