# ZJStatusBarHUD
It shows the location of some of the information in the status bar

```
/**
 *  显示自定义文字
 */
+ (void)showText:(NSString *)text;
/**
 *  显示自定义文字和图片
 */
+ (void)showImage:(UIImage *)image text:(NSString *)text; // 先图片后文字时为了避免用户装有KSImageNamed插件导致中文后面不提示的bug

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)text;

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)text;

/**
 *  显示正在加载信息
 */
+ (void)showLoading:(NSString *)text;

/**
 *  隐藏指示器
 */
+ (void)hide;
```