//
//  GroupCell.m
//  GroupPurchase
//
//  Created by Fu on 2017/7/24.
//  Copyright © 2017年 Fu. All rights reserved.
//

#import "GroupCell.h"
#import "GroupModel.h"

@interface GroupCell()

@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;


@end

@implementation GroupCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(GroupModel *)model{
    _model = model;
    
    [_shopImageView setImage:[UIImage imageNamed:model.icon]];
    _titleLabel.text = model.title;
    _priceLabel.text = [NSString stringWithFormat:@"$%@", model.price];
    _buyCountLabel.text = [NSString stringWithFormat:@"已购买%@件", model.buyCount];
}

@end
