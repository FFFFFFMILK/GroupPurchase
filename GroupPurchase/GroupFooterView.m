//
//  GroupFooterView.m
//  GroupPurchase
//
//  Created by Fu on 2017/7/25.
//  Copyright © 2017年 Fu. All rights reserved.
//

#import "GroupFooterView.h"

@interface GroupFooterView()
@property (weak, nonatomic) IBOutlet UIView *downloadingView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *chrissieView;

@end

@implementation GroupFooterView

- (IBAction)didClickLoadBtn:(UIButton *)sender {
    // 有涉及到其他控件的操作，最好让控制器去实现这个函数
    if ([self.delegate respondsToSelector:@selector(groupFooterView:didClickBtn:)]) {
        [self.delegate groupFooterView:self didClickBtn:sender];
    }
}

-(void)setShowLoadingView:(BOOL)showLoadingView{
    _downloadingView.alpha = showLoadingView ? 1 : 0;
    if (showLoadingView) {
        [_chrissieView startAnimating];
    }else{
        [_chrissieView stopAnimating];
    }
}

@end
