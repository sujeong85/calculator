//
//  Calculator.h
//  Sample
//
//  Created by user on 2015. 1. 5..
//  Copyright © 2015년 crystal, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

//setter, getter의 역할
@property (nonatomic, assign) double accumulator;
//atomic 특정 스레드가 값을 참조하고 있는경우 다른 스레드에서 값 변경 불가
//nonatomic 속도가 좀 더 빠른 장점이 있음.

//기존의 setter, getter
//setter
//-(void) setAccumulator:(double)value;
//getter
//-(double) accumulator;


//page 80
//누산기 메소드

-(void) clear;

//산술연산 메서드
-(void) add : (double)value;
-(void) subtract:(double)value;
-(void)multiply:(double)value;
-(void)divide:(double)value;
@end
