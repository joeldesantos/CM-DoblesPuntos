//
//  DataClass.h
//  CM-DoblesPuntos
//
//  Created by Aleyr on 8/20/15.
//  Copyright (c) 2015 CM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataClass : NSObject {

    int dataIndex;

    NSMutableArray *maCities;
    NSMutableArray *maLongitudes;
    NSMutableArray *maLatitudes;
}

@property()int dataIndex;

@property(nonatomic,retain)NSMutableArray *maCities;
@property(nonatomic,retain)NSMutableArray *maLongitudes;
@property(nonatomic,retain)NSMutableArray *maLatitudes;

+(DataClass*)getInstance;

@end
