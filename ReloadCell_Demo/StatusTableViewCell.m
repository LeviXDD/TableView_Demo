//
//  StatusTableViewCell.m
//  ReloadCell_Demo
//
//  Created by 黎海涛 on 15/9/9.
//  Copyright (c) 2015年 dianzhidao. All rights reserved.
//

#import "StatusTableViewCell.h"
#import "Status.h"
#pragma mark - 颜色相关
#define HTColor(r,g,b) [UIColor colorWithHue:r/255.0 saturation:g/255.0 brightness:b/255.0 alpha:1]
#define kStatusTableViewCellControlSpacing 10 //控件间距
#define kStatusTableViewCellBackgroundColor HTColor(251,251,251)
#define kStatusGrayColor HTColor(50,50,50)
#define kStatusLightGrayColor HTColor(120,120,120)

#pragma mark - 宽高相关
#define kStatusTableViewCellAvatarWidth 40 //头像宽度
#define kStatusTableViewCellAvatarHeight kStatusTableViewCellAvatarWidth
#define kStatusTableViewCellUserNameFontSize 14
#define kStatusTableViewCellMbTypeWidth 13 //会员图标宽度
#define kStatusTableViewCellMbTypeHeight kStatusTableViewCellMbTypeWidth
#define kStatusTableViewCellCreateAtFontSize 12
#define kStatusTableViewCellSourceFontSize 12
#define kStatusTableViewCellTextFontSize 14

@interface StatusTableViewCell() {
    UIImageView *_avatar;
    UIImageView *_mbtype;
    UILabel *_userName;
    UILabel *_createAt;
    UILabel *_source;
    UILabel *_text;
}

@end

@implementation StatusTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}

-(void)initSubView{
    _avatar = [[UIImageView alloc]init];
    [self addSubview:_avatar];
    
    _userName = [[UILabel alloc]init];
    _userName.textColor = kStatusGrayColor;
    _userName.font = [UIFont systemFontOfSize:kStatusTableViewCellUserNameFontSize];
    [self addSubview:_userName];
    
    _mbtype = [[UIImageView alloc]init];
    [self addSubview:_mbtype];
    
    _createAt = [[UILabel alloc]init];
    _createAt.font = [UIFont systemFontOfSize:kStatusTableViewCellCreateAtFontSize];
    _createAt.textColor = kStatusLightGrayColor;
    [self addSubview:_createAt];
    
    _source = [[UILabel alloc]init];
    _source.textColor = kStatusLightGrayColor;
    _source.font = [UIFont systemFontOfSize:kStatusTableViewCellSourceFontSize];
    [self addSubview:_source];
    
    _text = [[UILabel alloc]init];
    _text.textColor = kStatusGrayColor;
    _text.font = [UIFont systemFontOfSize:kStatusTableViewCellTextFontSize];
    _text.numberOfLines = 0;
    [self addSubview:_text];
}

-(void)setStatus:(Status *)status{
    CGFloat avatarX = 10,avatarY = 10;
    CGRect avatarRect = CGRectMake(avatarX, avatarY, kStatusTableViewCellAvatarWidth, kStatusTableViewCellAvatarHeight);
    _avatar.image = [UIImage imageNamed:status.profileImageUrl];
    _avatar.frame = avatarRect;
    
    CGFloat userNameX = CGRectGetMaxX(_avatar.frame) +kStatusTableViewCellControlSpacing;
    CGFloat userNameY = avatarY;
    CGSize userNameSize = [status.userName sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellUserNameFontSize]}];
    CGRect userNameRect = CGRectMake(userNameX, userNameY, userNameSize.width, userNameSize.height);
    _userName.text = status.userName;
    _userName.frame = userNameRect;
    
    CGFloat mbTypeX = CGRectGetMaxX(_userName.frame) + kStatusTableViewCellControlSpacing;
    CGFloat mvTypeY = avatarY;
    CGRect mbtypeRect = CGRectMake(mbTypeX, mvTypeY, kStatusTableViewCellMbTypeWidth, kStatusTableViewCellMbTypeHeight);
    _mbtype.image = [UIImage imageNamed:status.mbtype];
    _mbtype.frame = mbtypeRect;
    
    CGSize createAtSize = [status.createAt sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellCreateAtFontSize]}];
    CGFloat createAtX = userNameX;
    CGFloat createAtY = CGRectGetMaxY(_avatar.frame) - createAtSize.height;
    CGRect createAtRet = CGRectMake(createAtX, createAtY, createAtSize.width, createAtSize.height);
    _createAt.text = status.createAt;
    _createAt.frame = createAtRet;
    
    CGSize sourceSize = [status.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellSourceFontSize]}];
    CGFloat sourceX = CGRectGetMaxX(_createAt.frame) + kStatusTableViewCellControlSpacing;
    CGFloat sourcey = createAtY;
    CGRect sourceRect = CGRectMake(sourceX, sourcey, sourceSize.width, sourceSize.height);
    _source.text = status.source;
    _source.frame = sourceRect;
    
    CGFloat textX = avatarX;
    CGFloat textY = CGRectGetMaxY(_createAt.frame) + kStatusTableViewCellControlSpacing;
    CGFloat textWidth = self.frame.size.width - kStatusTableViewCellControlSpacing*2;
    CGSize textSize = [status.text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellTextFontSize]} context:nil].size;
    CGRect textRect = CGRectMake(textX, textY, textSize.width, textSize.height);
    _text.text = status.text;
    _text.frame = textRect;
    
    _height = CGRectGetMaxY(_text.frame) + kStatusTableViewCellControlSpacing;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {}  //重写选中时间，取消选中

@end
