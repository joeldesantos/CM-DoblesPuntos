//
//  DataClass.m
//  CM-DoblesPuntos
//
//  Created by Aleyr on 8/20/15.
//  Copyright (c) 2015 CM. All rights reserved.
//

#import "DataClass.h"

@implementation DataClass

@synthesize dataIndex;

@synthesize maCities;
@synthesize maLongitudes;
@synthesize maLatitudes;

static DataClass *instance = nil;

+(DataClass *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [DataClass new];
            [instance initValues];
        }
    }
    return instance;
}

- (void)initValues
{
    dataIndex = 0;
    
    maCities         = [[NSMutableArray alloc] initWithObjects: @"México City", @"Páris", @"Londres", @"Madrid", nil];
    maLongitudes     = [[NSMutableArray alloc] initWithObjects: @"19.4265149", @"48.8588589", @"51.5286416", @"40.4379543", nil];
    maLatitudes      = [[NSMutableArray alloc] initWithObjects: @"-99.1364887", @"2.3470599", @"-0.1015987", @"-3.6795367", nil];
}

@end
