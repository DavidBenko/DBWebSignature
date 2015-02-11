//
//  NSString+JWT.m
//  JWT
//
//  Created by David Benko on 2/11/15.
//  Copyright (c) 2015 Karma. All rights reserved.
//

#import "NSString+JWT.h"

@implementation NSString (JWT)
- (NSString *)base64UrlEncodedString {
    NSData *stringData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [stringData base64EncodedStringWithOptions:0];
    base64String = [base64String stringByReplacingOccurrencesOfString:@"=" withString:@""];
    base64String = [base64String stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    base64String = [base64String stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    
    return base64String;
}
@end
