//
//  Ratio.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRRatio.h"

@implementation FHIRRatio

@synthesize ratioDictionary = _ratioDictionary; //resources for ratio
@synthesize numerator = _numerator; //The numerator.
@synthesize denominator = _denominator; //The denominator.

- (id)init
{
    self = [super init];
    if (self) {
        _ratioDictionary = [[FHIRResourceDictionary alloc] init];
        _numerator = [[FHIRQuantity alloc] init];
        _denominator = [[FHIRQuantity alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _ratioDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [_numerator generateAndReturnDictionary], @"numerator",
                                           [_denominator generateAndReturnDictionary], @"denominator",
                                           nil];
    _ratioDictionary.resourceName = @"Ratio";
    [_ratioDictionary cleanUpDictionaryValues];
    return _ratioDictionary.dataForResource;
}

- (void)ratioParser:(NSDictionary *)dictionary
{
    [_numerator quantityParser:[dictionary objectForKey:@"numerator"]];
    [_denominator quantityParser:[dictionary objectForKey:@"denominator"]];
}

@end
