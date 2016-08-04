//
//  ViewController.m
//  TF0804
//
//  Created by admin on 16/8/4.
//  Copyright © 2016年 AlezJi. All rights reserved.
//http://www.jianshu.com/p/564728b048e0
//http://www.jianshu.com/p/a920df4b7936

#import "ViewController.h"



@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _textField.delegate = self;
    
//    [_textField setKeyboardType:UIKeyboardTypeDecimalPad];//带小数点
        [_textField setKeyboardType:UIKeyboardTypeNumberPad];//不带小数点

    
}
#pragma mark - 不带小数点   最多4位  不能连续输入两个0
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // 判断是否输入内容，或者用户点击的是键盘的删除按钮
    if (![string isEqualToString:@""]) {
        if ([textField isEqual:self.textField]) {
            if ([_textField.text isEqualToString:@"0"]) {
                return NO;
            }
            if (textField.text.length > 4) {
                return NO;
            }
            
        }
    }
    
    return YES;
}



#pragma mark - 带小数点   最多11位
/*
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // 判断是否输入内容，或者用户点击的是键盘的删除按钮
    if (![string isEqualToString:@""]) {
        NSCharacterSet *cs;
        if ([textField isEqual:self.textField]) {
            // 小数点在字符串中的位置 第一个数字从0位置开始
            NSInteger dotLocation = [textField.text rangeOfString:@"."].location;
            
            // 判断字符串中是否有小数点，并且小数点不在第一位
            // NSNotFound 表示请求操作的某个内容或者item没有发现，或者不存在
            // range.location 表示的是当前输入的内容在整个字符串中的位置，位置编号从0开始
            if (dotLocation == NSNotFound && range.location != 0) {
                // 取只包含“myDotNumbers”中包含的内容，其余内容都被去掉
                // [NSCharacterSet characterSetWithCharactersInString:myDotNumbers]的作用是去掉"myDotNumbers"中包含的所有内容，只要字符串中有内容与"myDotNumbers"中的部分内容相同都会被舍去
                // 在上述方法的末尾加上invertedSet就会使作用颠倒，只取与“myDotNumbers”中内容相同的字符
                cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789.\n"] invertedSet];
                if (range.location >= 9) {
                    NSLog(@"单笔金额不能超过亿位");
                    if ([string isEqualToString:@"."] && range.location == 9) {
                        return YES;
                    }
                    
                    return NO;
                }
            }else {
                cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789\n"] invertedSet];
            }
            
            // 按cs分离出数组,数组按@""分离出字符串
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            BOOL basicTest = [string isEqualToString:filtered];
            if (!basicTest) {
                NSLog(@"只能输入数字和小数点");
                return NO;
            }
            if (dotLocation != NSNotFound && range.location > dotLocation + 2) {
                NSLog(@"小数点后最多两位");
                return NO;
            }
            
            if (textField.text.length > 11) {
                return NO;
            }
        }
    }
    
    return YES;
}
*/



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_textField becomeFirstResponder];
}

@end
