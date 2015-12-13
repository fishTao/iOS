//
//  FriendGroup.m
//  
//
//  Created by qingyun on 15/12/6.
//
//

#import "FriendGroup.h"
#import "FriendModel.h"
@implementation FriendGroup
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        //遍历friends，把字典转化成QYFriend
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in self.friends) {
            FriendModel *friend = [FriendModel friendWithDictionary:dic];
            [array addObject:friend];
        }
        self.friends = array;
    }
    return self;
}

+(instancetype)friendGroupWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}
@end
