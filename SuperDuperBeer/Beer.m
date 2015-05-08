//
//  Beer.m
//  SuperDuperBeer
//
//  Created by Filipe Patrício on 08/05/15.
//  Copyright (c) 2015 Filipe Patrício. All rights reserved.
//

#import "Beer.h"

@implementation Beer

-(instancetype)initWithName:(NSString*)name
              withCountryID:(NSUInteger)countryID
              withImageName:(NSString*)imageName
         withAlcoholPercent:(NSUInteger)alcoholPercent
{
    self = [super init];
    if(self)
    {
        self.name = name;
        self.countryID = countryID;
        self.imageName = imageName;
        self.alcoholPercent = alcoholPercent;
    }
    return self;
}

@end
