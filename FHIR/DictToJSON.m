//
//  DictToJSON.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-13.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "DictToJSON.h"
#import "Patient.h"

@implementation DictToJSON

@synthesize jsonString = _jsonString;

- (void)generateJsonString:(FHIRResourceDictionary *)json
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSData *encodedData = [NSJSONSerialization dataWithJSONObject:json.dataForResource options:NSJSONWritingPrettyPrinted error:nil];
    //_jsonString = [[NSString alloc] initWithData:encodedData encoding:NSUTF8StringEncoding];
    
    NSString *fileName = json.resourceName;
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[fileName stringByAppendingString:@".json"]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createFileAtPath:@"/Users/adamsippel/Patient.json" contents:encodedData attributes:nil];
    //[_jsonString writeToFile:filePath atomically:YES encoding: NSUTF8StringEncoding error: NULL];
    
    
}

@end