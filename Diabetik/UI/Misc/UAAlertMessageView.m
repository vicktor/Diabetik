//
//  UAAlertMessageView.m
//  Diabetik
//
//  Created by Nial Giacomelli on 05/04/2013.
//  Copyright 2013 Nial Giacomelli
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "UAAlertMessageView.h"

@implementation UAAlertMessageView

#pragma mark - Setup
- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title andMessage:(NSString *)message 
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];

        self.title = title;
        self.message = message;
        
        [self setNeedsDisplay];
    }
    return self;
}

#pragma mark - Rendering
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat height = 22.0f + 30.0f;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
    
    CGRect textFrame = [self.message boundingRectWithSize:CGSizeMake(self.frame.size.width-90.0f, CGFLOAT_MAX)
                                              options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                           attributes:@{NSFontAttributeName:[UAFont standardDemiBoldFontWithSize:18.0f]}
                                              context:nil];
    height += textFrame.size.height;
    
    CGRect f = CGRectMake(50.0f, floorf(self.frame.size.height/2-height/2), floorf(self.frame.size.width-100.0f), height);
    [self.title drawInRect:CGRectMake(f.origin.x, f.origin.y, f.size.width, 22.0f) withAttributes:@{NSFontAttributeName:[UAFont standardDemiBoldFontWithSize:18.0f], NSForegroundColorAttributeName:[UIColor colorWithRed:63.0f/255.0f green:63.0f/255.0f blue:63.0f/255.0f alpha:1.0f], NSParagraphStyleAttributeName:paragraphStyle}];

    [self.message drawInRect:CGRectMake(f.origin.x, f.origin.y + 32.0f, f.size.width, textFrame.size.height) withAttributes:@{NSFontAttributeName:[UAFont standardRegularFontWithSize:16.0f], NSForegroundColorAttributeName: [UIColor colorWithRed:114.0f/255.0f green:115.0f/255.0f blue:115.0f/255.0f alpha:1.0f], NSParagraphStyleAttributeName:paragraphStyle}];
}

@end