//
//  Tgmodel.m
//  
//
//  Created by qingyun on 15/12/6.
//
//

#import "Tgmodel.h"

@implementation Tgmodel

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)modelWithDictionary:(NSDictionary *)dict{
    return [[self alloc] initWithDictionary:dict];
}


@end
