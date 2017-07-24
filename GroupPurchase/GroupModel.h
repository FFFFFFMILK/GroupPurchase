//
//  GroupModel.h
//  GroupPurchase
//
//  Created by Fu on 2017/7/24.
//  Copyright © 2017年 Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject

@property (copy, nonatomic) NSString * buyCount;
@property (copy, nonatomic) NSString * icon;
@property (copy, nonatomic) NSString * price;
@property (copy, nonatomic) NSString * title;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)groupModelWithDict:(NSDictionary *)dict;

@end
