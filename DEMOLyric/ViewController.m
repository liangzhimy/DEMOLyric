//
//  ViewController.m
//  DEMOLyric
//
//  Created by liangzhimy on 16/9/11.
//  Copyright © 2016年 liangzhimy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat myWidth = 200;
    UIFont *myFont = [UIFont systemFontOfSize:17];
    
    NSString *myString = @"The way that iOS renders text continues to grow more powerful over the years as Apple adds more features and capabilities. The release of iOS 7 brought with it some of the most significant text rendering changes yet. Now iOS 8 builds on that power, and makes it easier to use. A brief overview of iOS text editing might help you keep things in perspective.";
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:myString];
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(myWidth, CGFLOAT_MAX)];
    
//    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithContainerSize:MakeSize(myWidth, FLT_MAX)];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    
    [layoutManager addTextContainer:textContainer];
    [textStorage addLayoutManager:layoutManager];
    [textStorage addAttribute:NSFontAttributeName value:myFont range:NSMakeRange(0, [textStorage length])];
    [textContainer setLineFragmentPadding:0.0];
    
    [layoutManager glyphRangeForTextContainer:textContainer];
    
    CGFloat height = [layoutManager usedRectForTextContainer:textContainer].size.height;

//    NSLayoutManager *layoutManager = [textView layoutManager];
    NSUInteger numberOfLines, index;
    NSUInteger numberOfGlyphs = [layoutManager numberOfGlyphs];
    NSRange lineRange;
    for (numberOfLines = 0, index = 0; index < numberOfGlyphs; numberOfLines++){
        (void) [layoutManager lineFragmentRectForGlyphAtIndex:index
                                               effectiveRange:&lineRange];
        index = NSMaxRange(lineRange);
        NSString *lineStr = [myString substringWithRange:lineRange];
        NSLog(@"%@", lineStr);
    }
    NSLog(@"LINE height %f ------------------", height);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
