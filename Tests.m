//
//  Tests.m
//  CapSort
//
//  Created by Ken Thomsen on 3/13/13.
//  Copyright (c) 2013 Ben McCloskey. All rights reserved.
//

#import "Tests.h"
#import "NSString+capSort.h"

@implementation Tests


-(BOOL) runAllTests
{
	if (!([self testReversal]))
	{
		printf("\nReversal Test FAILED");	
		return FALSE;
	}
	else
		printf("\nReversal Test passed!");
	
	
	if (!([self testVowelCapitalization]))
	{
		printf("\nVowels get Capitalized Test Test FAILED");
		return FALSE;
	}
	else
		printf("\nVowels get Capitalized Test passed!");
	
	
	if (!([self testConsonantCapitalization]))
	{
		printf("\nConsonants get lower-case Test FAILED");
		return FALSE;
	}
	else
		printf("\nConsonants get lower-case Test passed!");
	
	
	if (!([self testAllTogetherNow]))
	{
		printf("\nCombo Test FAILED");
		return FALSE;
	}
	else
		printf("\nCombo Test passed!\n");
	
	return TRUE;
}
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
	char placeholder1 = 'a';
	char placeholder2 = 'a';
	for (int x = 0;x < a; x++)
	{
		placeholder1 = array1[x];
		placeholder2 = array2[x];
		if (placeholder1 != placeholder2)
			return FALSE;
	}
	return TRUE;
}

-(BOOL)testReversal
{
	char sampleArrayReversal[] = {'1','2','3','4','5','6','7','8','9'};
	char reversalAnswer[] = {'9','8','7','6','5','4','3','2','1'};
	char testArray = capSort(sampleArrayReversal);
	BOOL testPassed = [self testThatArray:&testArray IsEqualTo:reversalAnswer];
	return testPassed;
}

- (BOOL)testVowelCapitalization
{
	char sampleArrayVowelCap[]={'A','a'};
	char answerArrayVowelCap[]={'A','A'};
	char testArray = capSort(sampleArrayVowelCap);	
	BOOL testPassed = [self testThatArray:&testArray IsEqualTo:answerArrayVowelCap];
	return testPassed;
}

-(BOOL)testConsonantCapitalization
{
	return TRUE;
}

-(BOOL)testAllTogetherNow
{
	return TRUE;
}

@end
