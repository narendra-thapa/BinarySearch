//
//  main.m
//  BinarySearch_SplitSearch
//
//  Created by Narendra Thapa on 2016-01-12.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>

int middleValue (int a, int b) {
    return (a+b)/2;
}

int main(int argc, const char * argv[]) {
    BOOL found = NO;
    NSArray *numbers = @[@1,@2,@3,@4,@6,@7,@8,@9,@10];                              // input array of integers
    NSUInteger count = [numbers count];                                             // array element count
    int num = 10;                                                                    // search item
    
    int lowerlimit = 0;
    int upperlimit = (int)count;
    int lowerold = (int)count;
    int upperold = 0;
    
    while (!found) {
        
        int midNumber  = middleValue(lowerlimit, upperlimit);
        NSLog(@"position %d", midNumber);
        NSNumber *arrayvalue = numbers[midNumber];
        
        
        if (num < arrayvalue.intValue){
            /// search again
            NSLog(@"positional value %d", arrayvalue.intValue);
            NSLog(@"Search value is Less Than");
            
            lowerlimit = upperold;
            upperlimit = midNumber;
            
            lowerold = midNumber;
            if ((upperlimit - lowerlimit) == 1) {
                found = YES;
                NSLog(@"Value not present in array");
            } else {
                found = NO;
            }
            
        } else if (num > arrayvalue.intValue) {
            /// search again
            NSLog(@"positional value %d", arrayvalue.intValue);
            NSLog(@"Search value is Greater Than");
            
            lowerlimit = midNumber;
            upperlimit = lowerold;
            
            upperold = midNumber;
            if ((upperlimit - lowerlimit) == 1) {
                found = YES;
                NSLog(@"Value not present in array");
            } else {
                found = NO;
            }
            
        } else if (num == arrayvalue.intValue) {
            /// print location
            found = YES;
            NSLog(@"Found value %d at position %d ", arrayvalue.intValue, midNumber);
        }
    }
    return 0;

}
