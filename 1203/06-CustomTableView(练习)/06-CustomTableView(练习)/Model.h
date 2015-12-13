//
//  Model.h
//  
//
//  Created by qingyun on 15/12/3.
//
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
//声明属性
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic) BOOL ison;

//初始化方法
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)modelWithDictionary:(NSDictionary *)dict;
@end
