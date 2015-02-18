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

- (NSString *)base64UrlDecodedString {
    NSString *decodedString = self;
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    decodedString = [decodedString stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    
    while (decodedString.length % 4 != 0) {
        decodedString = [decodedString stringByAppendingString:@"="];
    }
    
    decodedString = [[NSString alloc]initWithData:[[NSData alloc]initWithBase64EncodedString:decodedString options:0] encoding:NSUTF8StringEncoding];
    
    return decodedString;
}
@end
