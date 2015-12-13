//
//  FriendModel.m
//  
//
//  Created by qingyun on 15/12/6.
//
//

#import "FriendModel.h"

@implementation FriendModel
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)friendWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}

@end
