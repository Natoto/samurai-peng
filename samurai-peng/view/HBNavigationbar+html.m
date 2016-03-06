//
//  HBNavigationbar+html.m
//  samurai-peng
//
//  Created by BooB on 16/3/6.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "HBNavigationbar+html.h"
#import "_pragma_push.h"

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import "Samurai_HtmlRenderStyle.h"
#import "Samurai_HtmlRenderObject.h"
#import "Samurai_HtmlRenderStoreScope.h"
#import "Samurai_HtmlUserAgent.h"

// ----------------------------------
// Source code
// ----------------------------------

#pragma mark -

@implementation HBNavigationbar(Html)

+ (CSSViewHierarchy)style_viewHierarchy
{
    return CSSViewHierarchy_Leaf;
}

#pragma mark -

- (void)html_applyDom:(SamuraiHtmlDomNode *)dom
{
    [super html_applyDom:dom];
    self.text = [[dom computeInnerText] normalize];
//    self.titleLabel.hidden = NO;
//    [self setTitle:self.titleLabel.text forState:UIControlStateNormal];
}

- (void)html_applyStyle:(SamuraiHtmlRenderStyle *)style
{
    [super html_applyStyle:style];
    
//    self.titleLabel.font = [style computeFont:[SamuraiHtmlUserAgent sharedInstance].defaultFont];
//    self.titleLabel.textAlignment = [style computeTextAlignment:self.titleLabel.textAlignment];
//    self.titleLabel.baselineAdjustment = [style computeBaselineAdjustment:self.titleLabel.baselineAdjustment];
//    self.titleLabel.lineBreakMode = [style computeLineBreakMode:self.titleLabel.lineBreakMode];
//    self.titleLabel.numberOfLines = 0;
//    
//    [self setTitleColor:[style computeColor:self.titleLabel.textColor] forState:UIControlStateNormal];
//    [self setTitleShadowColor:self.titleLabel.shadowColor forState:UIControlStateNormal];
}

- (void)html_applyFrame:(CGRect)newFrame
{
    [super html_applyFrame:newFrame];
    
//    self.titleLabel.frame = CGRectMake( 0.0f, 0.0f, newFrame.size.width, newFrame.size.height );
//    self.titleLabel.hidden = NO;
}

#pragma mark -

- (id)store_serialize
{
    return [super store_serialize];
}

- (void)store_unserialize:(id)obj
{
    [super store_unserialize:obj];
}

- (void)store_zerolize
{
    [super store_zerolize];
}

@end

// ----------------------------------
// Unit test
// ----------------------------------

#pragma mark -

#if __SAMURAI_TESTING__

TEST_CASE( WebCore, UIButton_Html )

DESCRIBE( before )
{
}

DESCRIBE( after )
{
}

TEST_CASE_END

#endif	// #if __SAMURAI_TESTING__

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import "_pragma_pop.h"
