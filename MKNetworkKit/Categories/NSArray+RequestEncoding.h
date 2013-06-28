//
//  NSArray+NSArray_RequestEncoding.h
//  MKNetworkKit-iOS
//
//  Created by Conrad Calmez on 6/28/13.
//  Copyright (c) 2013 Steinlogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (RequestEncoding)

- (NSString*) urlEncodedKeyValueString;
- (NSString*) urlEncodedKeyValueStringUsingKeyFormat:(NSString*)formatString;

@end
