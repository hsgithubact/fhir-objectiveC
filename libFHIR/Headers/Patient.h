//
//  Patient.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Demographics.h"
#import "ExistanceChecker.h"
//#import "ResourceReference.h"
#import "Animal.h"
//#import "HumanId.h"
#import "Bool.h"
#import "Text.h"

//A patient is a person or animal that is receiving care

@interface Patient : Resource
    
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case Patient
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from patient in a dictionary format

- (void)patientParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into patient

@property (nonatomic, retain) FHIRResourceDictionary *patientDictionary;
@property (nonatomic) NSMutableArray *link; //THIS ARRAY IS FILLED WITH "ResourceReference" OBJECTS ONLY. A linked patient record is a record that concerns the same patient. Records are linked after it is realized that at least one was created in error.
@property (nonatomic, retain) Bool *active; //Whether the patient record is in use, or has been removed from active use
@property (nonatomic, retain) NSMutableArray *identifier; //THIS ARRAY IS FILLED WITH "HumanId" OBJECTS ONLY.. An identifier that applies to this person as a patient
@property (nonatomic, retain) Demographics *details; //Patient Demographic details
@property (nonatomic, retain) Animal *animal; //This element has a value if the patient is an animal
@property (nonatomic, retain) ResourceReference *provider; //The provider for whom this is a patient record
@property (nonatomic, retain) CodeableConcept *diet; //Dietary restrictions for the patient
@property (nonatomic, retain) CodeableConcept *confidentiality; //Confidentiality of the patient records
@property (nonatomic, retain) CodeableConcept *recordLocation; //The location of the paper record for the patient, if there is one
@property (nonatomic, retain) Text *genText; //text holder for extra generated text
@property (nonatomic, retain) Resource *resourceTypeName; //holds resource type, text, name, and extensions
    
@end

