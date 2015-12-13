//
//  FriendModel.h
//  
//
//  Created by qingyun on 15/12/6.
//
//

#import <Foundation/Foundation.h>

@interface FriendModel : NSObject
//声明属性
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *status;
@property (nonatomic) BOOL vip;

//声明初始化方法
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)friendWithDictionary:(NSDictionary *)dict;

@end
