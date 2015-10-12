//
//  CustomView.h
//  IBInspectable_IBDesignable_Demo
//
//  Created by 王若风 on 15/10/12.
//  Copyright © 2015年 王若风. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface CustomView : UIView

@property (nonatomic, strong) UILabel     *titleLabel;

@property (nonatomic, strong) IBInspectable UIImageView *imgView;//not support
@property (nonatomic, strong) IBInspectable NSNumber    *lineWidth;//not support
@property (nonatomic, assign) IBInspectable NSRange     range;//not support

@property (nonatomic, strong) IBInspectable UIColor     *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat     borderWidth;
@property (nonatomic, assign) IBInspectable BOOL        needUpdate;
@property (nonatomic, copy  ) IBInspectable NSString    *name;

@property (nonatomic, strong) IBInspectable UIImage     *image;
@property (nonatomic, assign) IBInspectable CGRect      rect;
@property (nonatomic, assign) IBInspectable CGSize      size;
@property (nonatomic, assign) IBInspectable CGPoint     point;




@end
