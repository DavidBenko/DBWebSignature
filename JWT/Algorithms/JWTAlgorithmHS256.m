//
//  JWTAlgorithmHS256.m
//  JWT
//
//  Created by David Benko on 2/11/15.
//  Copyright (c) 2015 Karma. All rights reserved.
//

#import "JWTAlgorithmHS256.h"

#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonHMAC.h>

@implementation JWTAlgorithmHS256

- (NSString *)name;
{
    return @"HS256";
}

- (NSData *)encodePayload:(NSString *)theString withSecret:(NSString *)theSecret;
{
    const char *cString = [theString cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cSecret = [theSecret cStringUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, cSecret, strlen(cSecret), cString, strlen(cString), cHMAC);
    return [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
}
@end
