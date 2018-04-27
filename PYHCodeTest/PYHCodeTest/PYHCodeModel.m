//  PYHCodeTest  PYHCodeModel.m.
//  Created 2018/4/27.

#import "PYHCodeModel.h"
#import <objc/runtime.h>

@interface PYHCodeModel ()
@property (nonatomic, strong) NSArray *allPropertyKey;
@end
@implementation PYHCodeModel
- (NSArray *)allPropertyKey {
    if (!_allPropertyKey) {
        NSMutableArray *pps = [NSMutableArray array];
        
        //获取当前类所有属性 进行初始化
        unsigned int outCount = 0;
        objc_property_t *models = class_copyPropertyList([self class], &outCount);//获取所有属性
        for (unsigned int i = 0; i < outCount; i ++) {
            objc_property_t model = models[i];//获取指定下标属性
            NSString *propertyKey = [NSString stringWithUTF8String:property_getName(model)];
            [pps addObject:propertyKey];
        }
        free(models);
        
        _allPropertyKey = pps.copy;
    }
    return _allPropertyKey;
}

//解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self.allPropertyKey enumerateObjectsUsingBlock:^(NSString * _Nonnull propertyKey, NSUInteger idx, BOOL * _Nonnull stop) {
            id propertyValue = [aDecoder decodeObjectForKey:propertyKey];
            [self setValue:propertyValue forKey:propertyKey];
        }];
    }
    return self;
}

//归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self.allPropertyKey enumerateObjectsUsingBlock:^(NSString * _Nonnull propertyKey, NSUInteger idx, BOOL * _Nonnull stop) {
        id propertyValue =  [self valueForKey:propertyKey];
        [aCoder encodeObject:propertyValue forKey:propertyKey];
    }];
}
@end
