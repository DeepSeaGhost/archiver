//  PYHCodeTest  PYHModel.h.
//  Created 2018/4/27.

#import "PYHCodeModel.h"

@interface PYHModel : PYHCodeModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, strong) NSNumber *sex;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
