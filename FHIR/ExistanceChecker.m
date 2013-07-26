//
//  ExistanceChecker.m
//  FHIR
//
//  Created by Adam Sippel on 2013-03-18.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "ExistanceChecker.h"

@implementation ExistanceChecker

+ (NSArray *)generateArray:(NSArray *)array //checks if an array is empty
{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    if ([array count] <= 0)
    {
        return NULL;
    }
    else
    {
        for (int i = 0; i < [array count]; i++)
        {
            [tempArray addObject:[[array objectAtIndex:i] generateAndReturnDictionary]];
        }
        return tempArray;
    }
}

+ (NSDictionary *)stringChecker:(String *)string //checks if a string is empty
{
    if (string)
    {
        return [string generateAndReturnDictionary];
    }
    else
    {
        return NULL;
    }
}

@end