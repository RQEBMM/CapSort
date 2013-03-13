//
//  CapSortTest.m
//  ArraySort
//
//  Created by Ken Thomsen on 3/13/13.
//  Copyright (c) 2013 Ben McCloskey. All rights reserved.
//

#import "CapSortTest.h"

@implementation CapSortTest

- (void)setUp
{    	
    char sampleArray[]= {'A','B','c','d','e','f','g','H','I','j','k','l','m','N','o','p','q','r','s','t','U','V','w','x','y','z','1','2','3','4','5','6','7','8','9','0'};
	char sampleArrayVowelCoverage[]={'a','e','i','o','u','y'};
	char sampleArrayConsonantCap[]={'B','b'};
	char sampleArrayConsonantCoverage[]={'B','C','D','E','F','G','H','I','J','K','L','M','N','P','Q','R','S','T','V','W','X','Z'};
	
}

-(BOOL)testThatArray:(char*)array1 IsEqualTo:(char*)array2
{
	size_t a = sizeof(array1);
	
	if (a != sizeof(array2))
		return FALSE;
	
	for (int x = 0;x < a; x++)
	{
		if (array1[x] != array2[x])
			return FALSE;
	}
	return TRUE;
}

-(void)testReversal
{
	char sampleArrayReversal[] = {'1','2','3','4','5','6','7','8','9'};
	char reversalAnswer[] = {'9','8','7','6','5','4','3','2','1'};
	BOOL testPassed = [self testThatArray:capSort(sampleArrayReversal) IsEqualTo:reversalAnswer];
	NSAssert(testPassed,@"sort does not reverse array");
}

- (void)testVowelCapitalization
{
	char sampleArrayVowelCap[]={'A','a'};
	
}

-(void)testConsonantCapitalization
{
	
}

-(void)testAllTogetherNow
{
	
}

@end
