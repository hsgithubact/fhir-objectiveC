//
//  FHIRResourceDictionary.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-07.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRResourceDictionary.h"

@implementation FHIRResourceDictionary

@synthesize dataForResource = _dataForResource;
@synthesize resourceName = _resourceName;

- (void)cleanAndCheck
{
    for (NSString *key in self.dataForResource)
    {
        if ([self.dataForResource objectForKey:key] == nil)
        {
            [self.dataForResource setValue:@"nil" forKey:key];
        }
    }
}

- (void)cleanUpDictionaryValues
{
#warning - this does not remove everything for some reason
    //remove entries with no values
    NSInteger *nullCount = 1;
    
    while (nullCount > 0)
    {
        nullCount = 0;
        NSDictionary *tempDict = [[NSDictionary alloc] initWithDictionary:_dataForResource];
    
        for (NSString* key in tempDict)
        {
            if ([key isEqualToString:@"div"] == FALSE)
            {
                NSObject *value = [tempDict valueForKey:key];
                if (value == NULL || value == [NSNull null] || [tempDict count] == 0)
                {
                    [_dataForResource removeObjectForKey:key];
                    nullCount++;
                }
                
                if ([value class] == [NSDictionary class])
                {
                    NSArray *tempValueHolder = [[NSArray alloc] initWithObjects:value, nil];
                    if ([[tempValueHolder objectAtIndex:0] count] == 0)
                    {
                        [_dataForResource removeObjectForKey:key];
                        nullCount++;
                    }
                }
            }
        }
    
        if ([tempDict count] == 0)
        {
            _dataForResource = NULL;
            nullCount = 0;
        }
        
    }
}

@end
