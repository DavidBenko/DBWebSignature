//
//  NSData+JWT.m
//  JWT
//
//  Created by David Benko on 2/11/15.
//  Copyright (c) 2015 Karma. All rights reserved.
//

#import "NSData+JWT.h"

@implementation NSData (JWT)
- (NSString *)base64UrlEncodedString {
    NSString *base64String = [self base64EncodedStringWithOptions:0];
    base64String = [base64String stringByReplacingOccurrencesOfString:@"=" withString:@""];
    base64String = [base64String stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    base64String = [base64String stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    
    return base64String;
}
@end
