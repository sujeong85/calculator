//
//  ViewController.m
//  Calculator
//
//  Created by leeSu-jeong on 2016. 8. 24..
//  Copyright © 2016년 crystal. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

enum opr
{
    none, //0
    plus, //1
    minus, //2
    divide,//3
    multiply //4
};

typedef enum opr Operator;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation ViewController
{
    int currentValue;
    Operator currentOpr;
    Calculator *calc;
}

- (IBAction)buttonClicked:(UIButton *)sender {
    //NSLog(@"ButtonClicked");
    
    UIButton *btn = (UIButton *)sender; //id(모든형을 받아주는) 타입으로 들어온 값을 UIButton형으로 cast해준다.
    int val = (int)btn.tag;//property 값에 접근하기 위해서는 . 을 사용한다
    //NSInteger는 int의 확장기능제공. NSInteger는 long의 크기와 같기 때문에 형변환
    
    currentValue = currentValue * 10 + val;
    
//    if (currentOpr == none){
//        currentValue = currentValue * 10 + val;
//    }else{
//        currentValue = val;
//    }
    
    
    self.myLabel.text = [NSString stringWithFormat:@"%d",currentValue]; //property접근하기 위해서는 self표시 해주어야 함.
}


- (IBAction)clear:(id)sender {
    currentValue = 0;
    currentOpr = none;
    self.myLabel.text = @"0";
}


- (IBAction)clickOpr:(id)sender {
    UIButton *btn = (UIButton *)sender;
    int tagNum = (int)btn.tag;
    
    switch (tagNum) {
        case 1:
            currentOpr = plus;
            break;
        case 2:
            currentOpr = minus;
            break;
        case 3:
            currentOpr = multiply;
            break;
        case 4:
            currentOpr = divide;
            break;
        default:
            break;
    }
    
    [calc setAccumulator:currentValue];
    currentValue = 0;
    
}


- (IBAction)clickEqual:(id)sender {
    switch (currentOpr) {
        case plus:
            [calc add: currentValue];
            currentValue = [calc accumulator];
            break;
        case minus:
            [calc subtract: currentValue];
            currentValue = [calc accumulator];
            break;
        case multiply:
            [calc multiply: currentValue];
            currentValue = [calc accumulator];
            break;
        case divide:
            [calc divide: currentValue];
            currentValue = [calc accumulator];
            break;
        default:
            break;
    }
    
    //currentValue = calc.accumulator; //currentValue = [calc accumulator];
    self.myLabel.text = [NSString stringWithFormat:@"%d",currentValue];
}


- (IBAction)unwind:(UIStoryboardSegue *)sender{
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //어플리케이션이 실행되면 가장 먼저 entry point로 지정된 view controller를 찾게 되고, view controller에 지정된 class가 수행된다.
    //view controller에서 가장 먼저 수행되는 메소드 viewDidLoad
    calc = [[Calculator alloc]init];
    currentOpr = none;
    currentValue = 0;
    
    self.myLabel.text = @"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
