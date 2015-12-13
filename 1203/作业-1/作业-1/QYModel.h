//
//  QYModel.h
//  
//
//  Created by qingyun on 15/12/3.
//
//

#import <Foundation/Foundation.h>

@interface QYModel : NSObject
@property (nonatomic ,strong) NSString *title;
@property (nonatomic ,strong) NSString *price;
@property (nonatomic ,strong) NSString *buycount;
@property (nonatomic ,strong) NSString *icon;
//初始化方法
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)modelWithDictionary:(NSDictionary *)dict;
@end
