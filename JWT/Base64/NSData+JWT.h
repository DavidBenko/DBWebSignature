//
//  NSData+JWT.h
//  JWT
//
//  Created by David Benko on 2/11/15.
//  Copyright (c) 2015 Karma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (JWT)
- (NSString *)base64UrlEncodedString;
@end
