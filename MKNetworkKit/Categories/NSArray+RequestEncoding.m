//
//  NSArray+NSArray_RequestEncoding.m
//  MKNetworkKit-iOS
//
//  Created by Conrad Calmez on 6/28/13.
//  Copyright (c) 2013 Steinlogic. All rights reserved.
//

#import "MKNetworkKit.h"

@implementation NSArray (RequestEncoding)

-(NSString*) urlEncodedKeyValueStringUsingKeyFormat:(NSString *)formatString {
    
    NSMutableString *string = [NSMutableString string];
    for (NSObject *value in self) {
        NSString *keyString = [formatString stringByAppendingString:@"[]"];
        if([value isKindOfClass:[NSString class]]) {
            [string appendFormat:@"%@=%@&", keyString, [((NSString*)value) mk_urlEncodedString]];
        } else if([value isKindOfClass:[NSDictionary class]]) {
            if ([(NSDictionary *)value count] > 0) {
                [string appendFormat:@"%@&", [(NSDictionary *)value urlEncodedKeyValueStringUsingKeyFormat:[keyString stringByAppendingString:@"[%@]"]]];
            }
        } else if([value isKindOfClass:[NSArray class]]) {
            if ([(NSArray *)value count] > 0) {
                [string appendFormat:@"%@&", [(NSArray *)value urlEncodedKeyValueStringUsingKeyFormat:keyString]];
            }
        } else {
            [string appendFormat:@"%@=%@&", keyString, value];
        }
    }
    
    if([string length] > 0)
        [string deleteCharactersInRange:NSMakeRange([string length] - 1, 1)];
    
    return string;
}

-(NSString*) urlEncodedKeyValueString {
    
    return [self urlEncodedKeyValueStringUsingKeyFormat:@"%@"];
}

@end
