//  PYHCodeTest  PYHModel.m.
//  Created 2018/4/27.

#import "PYHModel.h"

@implementation PYHModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
}
- (NSString *)debugDescription {
    return [self.name stringByAppendingFormat:@"-%@-%@-%@",self.age,self.sex,self.address];
}
- (NSString *)description {
    return [self.name stringByAppendingFormat:@"-%@-%@-%@",self.age,self.sex,self.address];
}
@end
