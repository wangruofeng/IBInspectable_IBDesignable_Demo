//
//  CustomView.m
//  IBInspectable_IBDesignable_Demo
//
//  Created by 王若风 on 15/10/12.
//  Copyright © 2015年 王若风. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect frame = self.bounds;
    CGContextSetLineWidth(context, _borderWidth);
    CGRectInset(frame, 5, 5);
    
    [_borderColor set];
    UIRectFrame(frame);
    
#if !TARGET_INTERFACE_BUILDER
    // this code will run in the app itself
#else
    // this code will execute only in IB
    [self install];
#endif
    
}

#pragma mark - Init
//IB 会执行
- (instancetype)initWithFrame:(CGRect)frame{
   self = [super initWithFrame:frame];
    if (self) {
        
        [self install];
    }
    
    return self;
}

// 此方法与你代码的其余部分一起编译，但只有当视图正在准备在 Interface Builder 显示时执行
- (void)prepareForInterfaceBuilder{
    
//    [self install];
    
}

- (void)install{
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.frame = CGRectMake(30, 30, 120, 30);
    self.titleLabel.text = @"defaultText";
    self.titleLabel.textColor = [UIColor blackColor];
    
    [self addSubview:_titleLabel];
    
    self.imgView = [[UIImageView alloc] init];
    self.imgView.frame = CGRectMake(30, 60, 50, 50);
    self.imgView.contentMode = UIViewContentModeScaleAspectFit;
    self.imgView.image = [UIImage imageNamed:@"1"];
    
    [self addSubview:_imgView];
}

#pragma mark - Setter
- (void)setBorderColor:(UIColor *)borderColor{
    
    if (_borderColor != borderColor) {
        _borderColor = borderColor;
    }
}

- (void)setBorderWidth:(CGFloat)borderWidth{

    
    if (_borderWidth != borderWidth) {
        _borderWidth = borderWidth;
    }
}

- (void)setName:(NSString *)name{
    if (_name != name) {
        _name = name;
        
        self.titleLabel.text = name;
    }
}

- (void)setImage:(UIImage *)image{
    if (_image != image) {
        _image = image;
        
        self.imgView.image = image;
    }
}

- (void)setLineWidth:(NSNumber *)lineWidth{
    if (_lineWidth != lineWidth) {
        _lineWidth = lineWidth;
        
        self.layer.borderWidth = lineWidth.floatValue;
    }
}

- (void)setRect:(CGRect)rect{
    _rect = rect;
    self.imgView.frame = rect;
}


- (void)setPoint:(CGPoint)point{
    _point = point;
    CGRect rect  = self.imgView.frame;
    rect.origin = point;
    self.imgView.frame = rect;
}

- (void)setSize:(CGSize)size{
    CGRect rect = self.imgView.frame;
    rect.size = size;
    self.imgView.frame = rect;
}
@end
