//
//  Coding.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"
#import "Uri.h"
#import "Code.h"
#import "String_.h"

//A reference to a code defined by a terminology system
@interface Coding : Type

- (Uri *)getSystem;
- (void) setSystem:(Uri *)value;
- (Code *)getCode;
- (void)setCode:(Code *)value;
- (String_ *)getDisplay;
- (void)setDisplay:(String_ *)value;

@end