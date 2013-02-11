//
//  Demographics.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A description of an individual who is involved in healthcare processes. The individual may be a patient, a provider of care services, or related to a patient in some way or other.
 */

#import <Foundation/Foundation.h>
#import "Type.h"
#import "Element.h"
#import "CodeableConcept.h"

@interface Demographics : Type

- (NSMutableArray *)getName; //return an array of names <HumanName>
- (NSMutableArray *)getTelecom; //return an array of contacts <contact>
- (Coding *)getGender;
- (void)setGender:(Coding *)value;
- (NSDate *)getBirthDate;
- (void)setBirthDate:(NSDate *)value;
- (BOOL *)getDeceased;
- (void)setDeceased:(BOOL *)value;
- (NSMutableArray *)getAddress; //return an array of addresses <address>
- (CodeableConcept *)getMaritalStatus;
- (void)setMaritalStatus:(CodeableConcept *)value;
- (NSMutableArray *)getLanguage; //return an array of languages <language>

@property (nonatomic, retain) NSMutableArray *name; //A name associated with the individual.
@property (nonatomic, retain) NSMutableArray *telecom; //A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted.
@property (nonatomic, retain) Coding *gender; //Administrative Gender - the gender that the patient is considered to have for administration / record keeping purposes
@property (nonatomic, retain) NSDate *birthDate; //The birth date for the individual, to the degre of precision now
@property (nonatomic) BOOL *deceased; //Indicates if the individual is deceased or not
@property (nonatomic, retain) NSMutableArray *address; //One or more addresses for the individual
@property (nonatomic, retain) CodeableConcept *maritalStatus; //This field contains a patient's marital (civil) status.
@property (nonatomic, retain) NSMutableArray *language; //A language spoken by the person, with proficiency

@end