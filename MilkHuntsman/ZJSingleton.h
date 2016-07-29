//完整的单例模式
//.h文件
#define ZJSingletonH(name) +(instancetype)share##name;

//.m文件
#define ZJSingletonM(name) \
static id _instance; \
 \
+(instancetype)allocWithZone:(struct _NSZone *)zone{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance; \
} \
 \
+(instancetype)share##name{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [[self alloc] init]; \
    }); \
    return _instance; \
} \
 \
-(id)copyWithZone:(NSZone *)zone{ \
    return _instance; \
}