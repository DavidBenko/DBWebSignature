//
//  JWT.h
//  JWT
//
//  Created by Klaas Pieter Annema on 31-05-13.
//  Copyright (c) 2013 Karma. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JWTAlgorithm.h"
#import "JWTClaimsSet.h"

@interface JWT : NSObject

+ (NSString *)encodeClaimsSet:(JWTClaimsSet *)claimsSet secret:(NSString *)secret algorithm:(id<JWTAlgorithm>)algorithm;
+ (NSString *)encodePayload:(id)payload secret:(NSString *)secret algorithm:(id<JWTAlgorithm>)algorithm;

@end