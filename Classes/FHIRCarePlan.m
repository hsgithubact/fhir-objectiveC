//
//  CarePlan.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-03.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRCarePlan.h"

@implementation FHIRCarePlan

@synthesize carePlanDictionary = _carePlanDictionary; //a dictionary containing all resources in this carePlan object
@synthesize resourceTypeValue = _resourceTypeValue;
@synthesize identifier = _identifier; //Unique identifier by which the care plan is known in different business contexts.
@synthesize patient = _patient; //Identifies the patient/subject whose intended care is described by the plan.
@synthesize status = _status; //Indicates whether the plan is currently being acted upon, represents future intentions or is now just historical record.
@synthesize period = _period; //Indicates when the plan did (or is intended to) come into effect and end.
@synthesize modified = _modified; //Identifies the most recent date on which the plan has been revised.
@synthesize concern = _concern; //THIS ARRAY CONTAINS "Resource(Problem)" OBJECTS ONLY. Identifies the problems/concerns/diagnoses/etc. whose management and/or mitigation are handled by this plan.
@synthesize notes = _notes; //General notes about the care plan not covered elsewhere.
@synthesize participant = _participant; //THIS ARRAY CONTAINS "Participant" OBJECTS ONLY. Identifies all people and organizations who are expected to be involved in the care envisioned by this plan.
@synthesize activity = _activity; //THIS ARRAY CONTAINS "Activity" OBJECTS ONLY. Identifies a planned action to occur as part of the plan. For example, a medication to be used, lab tests to perform, self-monitoring, education, etc.
@synthesize goal = _goal; //THIS ARRAY CONTAINS "Goal" OBJECTS ONLY. Describes the intended objective(s) of carrying out the Care Plan.

- (id)init
{
    self = [super init];
    if (self) {
        _carePlanDictionary = [[FHIRResourceDictionary alloc] init];
        _resourceTypeValue = [[FHIRResource alloc] init];
        _identifier = [[FHIRIdentifier alloc] init];
        _patient = [[FHIRResourceReference alloc] init];
        _status = [[FHIRCode alloc] init];
        _period = [[FHIRPeriod alloc] init];
        _modified = [[NSDate alloc] init];
        _notes = [[FHIRString alloc] init];
        _concern = [[NSMutableArray alloc] init];
        _participant = [[NSMutableArray alloc] init];
        _activity = [[NSMutableArray alloc] init];
        _goal = [[NSMutableArray alloc] init];
    }
    return self;
}

//override method
- (NSString *)getResourceType
{
    return [_resourceTypeValue returnResourceType];
}

- (FHIRResourceDictionary *)generateAndReturnResourceDictionary
{
    _carePlanDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                     [_identifier generateAndReturnDictionary], @"identifier",
                                                     [_patient generateAndReturnDictionary], @"patient",
                                                     [_status generateAndReturnDictionary], @"status",
                                                     [_period generateAndReturnDictionary], @"period",
                                                     [NSDateFormatter localizedStringFromDate:_modified dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"modified",
                                                     [FHIRExistanceChecker generateArray:_concern], @"concern",
                                                     [FHIRExistanceChecker generateArray:_participant], @"participant",
                                                     [FHIRExistanceChecker generateArray:_activity], @"activity",
                                                     [FHIRExistanceChecker generateArray:_goal], @"goal",
                                                     [_notes generateAndReturnDictionary], @"notes",
                                                     [_resourceTypeValue.text generateAndReturnDictionary], @"text",
                                                     [FHIRExistanceChecker generateArray:_resourceTypeValue.extensions], @"extension",
                                                     [FHIRExistanceChecker generateArray:_resourceTypeValue.contained], @"contained",
                                                     nil];
    [_carePlanDictionary cleanUpDictionaryValues];
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_carePlanDictionary.dataForResource, @"CarePlan", nil];
    returnable.resourceName = @"carePlan";
    [returnable cleanUpDictionaryValues];
    return returnable;
}

- (void)carePlanParser:(NSDictionary *)dictionary
{
    [_resourceTypeValue setResouceTypeValue:@"carePlan"];
    NSDictionary *carePlanDict = [dictionary objectForKey:@"CarePlan"];
    //NSLog(@"%@", carePlanDict);
    
    [_resourceTypeValue resourceParser:carePlanDict];
    
    [_identifier identifierParser:[carePlanDict objectForKey:@"identifier"]];
    [_patient resourceReferenceParser:[carePlanDict objectForKey:@"patient"]];
    [_status setValueCode:[carePlanDict objectForKey:@"status"]];
    [_period periodParser:[carePlanDict objectForKey:@"period"]];
    _modified = [FHIRExistanceChecker generateDateTimeFromString:[carePlanDict objectForKey:@"modified"]];
    
    //_concern
    NSArray *concernArray = [[NSArray alloc] initWithArray:[carePlanDict objectForKey:@"concern"]];
    _concern = [[NSMutableArray alloc] init];
    for (int i = 0; i < [concernArray count]; i++)
    {
        FHIRResourceReference *tempCO = [[FHIRResourceReference alloc] init];
        [tempCO resourceReferenceParser:[concernArray objectAtIndex:i]];
        [_concern addObject:tempCO];
    }
    
    //_participant
    NSArray *participantArray = [[NSArray alloc] initWithArray:[carePlanDict objectForKey:@"participant"]];
    _participant = [[NSMutableArray alloc] init];
    for (int i = 0; i < [participantArray count]; i++)
    {
        FHIRParticipant *tempPA = [[FHIRParticipant alloc] init];
        [tempPA participantParser:[participantArray objectAtIndex:i]];
        [_participant addObject:tempPA];
    }
    
    //_activity
    NSArray *activityArray = [[NSArray alloc] initWithArray:[carePlanDict objectForKey:@"activity"]];
    _activity = [[NSMutableArray alloc] init];
    for (int i = 0; i < [activityArray count]; i++)
    {
        FHIRActivity *tempAC = [[FHIRActivity alloc] init];
        [tempAC activityParser:[activityArray objectAtIndex:i]];
        [_activity addObject:tempAC];
    }
    
    //_goal
    NSArray *goalArray = [[NSArray alloc] initWithArray:[carePlanDict objectForKey:@"goal"]];
    _goal = [[NSMutableArray alloc] init];
    for (int i = 0; i < [goalArray count]; i++)
    {
        FHIRGoal *tempGO = [[FHIRGoal alloc] init];
        [tempGO goalParser:[goalArray objectAtIndex:i]];
        [_goal addObject:tempGO];
    }
    
    [_notes setValueString:[carePlanDict objectForKey:@"notes"]];
    
}

@end
