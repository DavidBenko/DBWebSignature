//
//  JWT.m
//  JWT
//
//  Created by Klaas Pieter Annema on 31-05-13.
//  Copyright (c) 2013 Karma. All rights reserved.
//

#import "JWT.h"

#import "NSString+JWT.h"
#import "NSData+JWT.h"

#import "JWTAlgorithmHS512.h"
#import "JWTClaimsSetSerializer.h"

@implementation JWT

+ (NSString *)encodeClaimsSet:(JWTClaimsSet *)claimsSet secret:(NSString *)secret algorithm:(id<JWTAlgorithm>)algorithm {
    NSDictionary *payload = [JWTClaimsSetSerializer dictionaryWithClaimsSet:claimsSet];
    return [self encodePayload:payload secret:secret algorithm:algorithm];
}

+ (NSString *)encodePayload:(id)payload secret:(NSString *)secret algorithm:(id<JWTAlgorithm>)algorithm
{
    NSDictionary *header = @{@"typ": @"JWT", @"alg": algorithm.name};
    
    NSString *headerSegment = [self encodeSegment:header];
    NSString *payloadSegment = [self encodeSegment:payload];
    
    NSString *signingInput = [@[headerSegment, payloadSegment] componentsJoinedByString:@"."];
    NSString *signedOutput = [[algorithm encodePayload:signingInput withSecret:secret] base64UrlEncodedString];
    return [@[headerSegment, payloadSegment, signedOutput] componentsJoinedByString:@"."];
}

+ (NSString *)encodeSegment:(id)theSegment;
{
    NSError *error;
    NSString *encodedSegment = [[NSJSONSerialization dataWithJSONObject:theSegment options:0 error:&error] base64UrlEncodedString];
    
    NSAssert(!error, @"Could not encode segment: %@", [error localizedDescription]);
    
    return encodedSegment;
}

@end
