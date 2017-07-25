//
//  GroupFooterView.h
//  GroupPurchase
//
//  Created by Fu on 2017/7/25.
//  Copyright © 2017年 Fu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GroupFooterView;

@protocol GroupFooterViewDelegate <NSObject>

-(void)groupFooterView:(GroupFooterView *)footerView didClickBtn:(UIButton *)btn;

@end

@interface GroupFooterView : UIView

@property (assign, nonatomic) id<GroupFooterViewDelegate> delegate;

@property (assign, nonatomic) BOOL showLoadingView;

@end
