//
//  GroupModel.m
//  GroupPurchase
//
//  Created by Fu on 2017/7/24.
//  Copyright © 2017年 Fu. All rights reserved.
//

#import "GroupModel.h"

@implementation GroupModel

-(instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)groupModelWithDict:(NSDictionary *)dict{
    return [[GroupModel alloc]initWithDict:dict];
}

@end
