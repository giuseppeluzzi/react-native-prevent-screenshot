#import "RNPreventScreenshot.h"

@implementation RNPreventScreenshot {
    UIView *_blockView;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE();


- (instancetype)init {
  if (self = [super init]) {
    CGFloat boundLength = MAX([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    _blockView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, boundLength, boundLength)];
    _blockView.backgroundColor = UIColor.blackColor;
  }
  return self;
}

#pragma mark - PreventScreen API

- (void)preventScreenRecording {
  if (@available(iOS 11.0, *)) {
    BOOL isCaptured = [[UIScreen mainScreen] isCaptured];

    if (isCaptured) {
      [UIApplication.sharedApplication.keyWindow.subviews.firstObject addSubview:_blockView];
    } else {
      [_blockView removeFromSuperview];
    }
  }
}


#pragma mark - Public API

RCT_REMAP_METHOD(preventScreenCapture,
findEventsWithResolver:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject) {
    if (@available(iOS 11.0, *) ) {
      dispatch_async(dispatch_get_main_queue(), ^{
        [self preventScreenRecording];
      });

      [[NSNotificationCenter defaultCenter] removeObserver:self name:UIScreenCapturedDidChangeNotification object:nil];
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preventScreenRecording) name:UIScreenCapturedDidChangeNotification object:nil];
    }
    
    resolve([NSNull null]);
}


RCT_REMAP_METHOD(enableScreenCapture,
_findEventsWithResolver:(RCTPromiseResolveBlock)resolve
_rejecter:(RCTPromiseRejectBlock)reject) {
  if (@available(iOS 11.0, *)) {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIScreenCapturedDidChangeNotification object:nil];
  }
  resolve([NSNull null]);
}

@end
