//
//  Base64Binary.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"

@interface Base64Binary : Type

- (Byte *)getValue;
- (void)setValue:(Byte *)value;

#warning - Should be an array of Bytes?
@property (nonatomic) Byte *byteArray;

@end
