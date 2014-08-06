
//1 . 判断是否是 iph5的宏
//技巧规范,如果是结果的宏,最好写括号
#define isIphone5 ([UIScreen mainScreen].bounds.size.height==568)


//2 . 日志输出宏定义: DEBUG是系统判定的,不用关心
#ifdef DEBUG
//调试状态
#define MyLog(...) NSLog(__VA_ARGS__)
#else
//发布状态
#define myLog(...) 


#endif