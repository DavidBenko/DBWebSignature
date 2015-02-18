//
//  DBWebSignature.h
//  JWT
//
//  Created by David Benko on 2/13/15.
//  Copyright (c) 2015 Karma. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JWTAlgorithm.h"
#import "JWTClaimsSet.h"

@interface DBWebSignature : NSObject

/**
 * Initializes a new DBWebSignature object with a secret and algorithm
 *
 * @param secret The secret (shared by the signer and verifier)
 * @param algorithm The algorithm to sign/verify with
 * @return new DBWebSignature
 */
- (instancetype)initWithSecret:(NSString *)secret algorithm:(id<JWTAlgorithm>)algorithm;

/**
 * Generates a new token from a JSON object
 *
 * @param payload the JSON object to generate a token with. Can be NSArray, NSDictionary, or NSString.
 * @return the token
 */
- (NSString *)generateToken:(id)payload;

/**
 * Validates token against the payload it was generated with.
 *
 * @param token the token to validate
 * @param payload the JSON object the token was generated with
 * @return true is validation succeeds, else false
 */
- (BOOL)validateToken:(NSString *)token payload:(id)payload;

/**
 * Generates new token for a claimsSet
 *
 * @param the claims set
 * @return the token
 */
- (NSString *)encodeClaimsSet:(JWTClaimsSet *)claimsSet;
@end
