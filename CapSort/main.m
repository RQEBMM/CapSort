//
//  main.m
//  ArraySort
//
//  Created by Ben McCloskey on 3/13/13.
//  Copyright (c) 2013 Ben McCloskey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+capSort.h"

const char (*capSort(char *arrayOfChars));
void showOutput(const char *arrayToPrint);

char sampleArray[]= {'A','B','c','d','e','f','g','H','I','j','k','l','m','N','o','p','q','r','s','t','U','V','w','x','y','z','1','2','3','4','5','6','7','8','9','0'};

int main(int argc, const char * argv[])
{
	@autoreleasepool {
		if ([[[NSString alloc] init]runAllTests])
		{
            printf("Sample:\nInput :%s",sampleArray);
            showOutput(capSort(sampleArray));
        }
	}
	return 0;
}

const char (*capSort(char *arrayOfChars))
{
	//convert to NSString
	NSString *arrayAsNSString = [NSString stringWithCString:arrayOfChars encoding:NSUTF8StringEncoding];
	//run transformation on NSString
	arrayAsNSString = [arrayAsNSString capSort];
	// convert back and return array
	return [arrayAsNSString UTF8String];
}

void showOutput(const char *arrayToPrint)
{
	printf("\nOutput:%s",arrayToPrint);
}