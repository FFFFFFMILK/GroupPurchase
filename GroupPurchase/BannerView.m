//
//  BannerView.m
//  GroupPurchase
//
//  Created by Fu on 2017/7/24.
//  Copyright © 2017年 Fu. All rights reserved.
//

#import "BannerView.h"

@interface BannerView()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView * scrollView;
@property (strong, nonatomic) UIPageControl * pageControl;

@end

@implementation BannerView

-(instancetype)initWithFrame:(CGRect)frame WithImageArray:(NSArray *)imageArr{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupScrollView];
        
        [self setupPageControl];
        
        [self setupDataWithArray:imageArr];
    }
    return self;
}

-(void)setupScrollView{
    _scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    
    _scrollView.delegate = self;
    
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    
    [self addSubview:_scrollView];
}

-(void)setupPageControl{
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
    _pageControl.center = CGPointMake(self.frame.size.width/2, self.frame.size.height - 10);
    
    _pageControl.currentPage = 0;
    
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    [self addSubview:_pageControl];
}

-(void)setupDataWithArray:(NSArray *)imgArr{
    // 设置图片

    for (int i=0; i < imgArr.count; i++) {
        UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgArr[i]]];
        imgView.frame = CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
        
        [_scrollView addSubview:imgView];
    }
    
    _scrollView.contentSize = CGSizeMake(imgArr.count * self.frame.size.width, self.frame.size.height);
    
    _pageControl.numberOfPages = imgArr.count;

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    _pageControl.currentPage = scrollView.contentOffset.x / self.frame.size.width;
}


@end
