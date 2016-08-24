//
//  Calculator.m
//  Sample
//
//  Created by user on 2015. 1. 5..
//  Copyright © 2015년 crystal, Inc. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
//@property로 대체함
//{
//    double accumulator;
//}
//page 80
//누산기 메소드
//@property로 대체함
//-(void) setAccumulator:(double)value
//{
//    accumulator = value;
//}
//@property로 대체함
//-(double) accumulator
//{
//    return accumulator;
//}
-(void) clear
{
    self.accumulator = 0; //자신이 소유한 property에 접근하기 위해 self(객체자신)로 명시함.
}

//산술연산 메서드
-(void) add : (double)value
{
    self.accumulator += value;
}
-(void) subtract:(double)value
{
    self.accumulator -= value;
}
-(void)multiply:(double)value
{
    self.accumulator *= value;
}
-(void)divide:(double)value
{
    self.accumulator /= value;
}

@end
