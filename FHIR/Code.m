//
//  Code.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Code.h"

@implementation Code

- (NSString *)getValue
{
    return self.codeText;
}

- (void)setValue:(NSString *)value
{
    self.codeText = value;
}

@end
