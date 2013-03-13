//
//  NSString+capSort.m
//  ArraySort
//
//  Created by Ken Thomsen on 3/13/13.
//  Copyright (c) 2013 Ben McCloskey. All rights reserved.
//

#import "NSString+capSort.h"

/*
 method that takes an array of characters and returns an array of the same characters in reversed order with every consonant between 'a' and 'z' lower cased and every vowel between 'a' and 'z' upper cased. Prove your implementation works.
 */

@implementation NSString (capSort)

-(NSString *)capSort
{	
	NSCharacterSet *setOfLowerCaseVowels= [NSCharacterSet characterSetWithCharactersInString:@"aeiouy"];
	NSCharacterSet *setOfUpperCaseConsonants = [NSCharacterSet characterSetWithCharactersInString:@"BCDFGHJKLMNPQRSTVWXZ"];
	NSString *newString = @"";
	
	//work on input string back-to-front
	//we'll build the new string front-to-back
	for (NSUInteger x = [self length];x > 0;x--)
	{
		//grab a single character
		unichar charAtIndex = [self characterAtIndex:x-1];
		//if a lower case vowel
		if ([setOfLowerCaseVowels characterIsMember:charAtIndex])
		{
			//make upper case (via bit-flipping) and place at beginning
			charAtIndex = charAtIndex - (32);
		}
		//else if an upper case consonant
		else if ([setOfUpperCaseConsonants characterIsMember:charAtIndex])
		{
			//make lower case and place at beginning
			charAtIndex = charAtIndex + (32);
		}
		//append char to new string
		newString = [NSString stringWithFormat:@"%@%@",newString,[NSString stringWithCharacters:&charAtIndex length:1]];
	}
	//and we're done!
	return newString;
}

//I wrote up my own very basic tests because Xcode does not like adding a SenTest target to Command-Line Applications

-(BOOL) runAllTests
{
	BOOL testsAllPassed = TRUE;
	
	printf("\nReversal Test:");
	if (!([self testReversal])){
		printf("FAILED");
		testsAllPassed = FALSE;
	}else
		printf("PASSED!");
	
	printf("\nVowel Capitalization Test:");
	if (!([self testVowelCapitalization]))	{
		printf("FAILED");
		testsAllPassed =  FALSE;
	}else
		printf("PASSED!");
	
	printf("\nTes that consonants get switched to lower-case:");
	if (!([self testConsonantCapitalization]))	{
		printf("FAILED");
		testsAllPassed =  FALSE;
	}else
		printf("PASSED!");	
	
	printf("\nTest that all vowels get checked:");
	if (!([self testVowelCoverage])){
		printf("FAILED");
		testsAllPassed =  FALSE;
	}else
		printf("PASSED!");
	
	printf("\nTest that all consonants get checked:");
	if (!([self testConsonantCoverage])){
		printf("FAILED");
		testsAllPassed =  FALSE;
	}else
		printf("PASSED!");
	
	printf("\n\n\n");
	return testsAllPassed;
}

-(BOOL)testReversal
{
	NSString *reversalSample  = @"123456789";
	NSString *reversalAnswer  = @"987654321";
	
	NSString *testArray = [reversalSample capSort];
	
	return [testArray isEqualToString:reversalAnswer];
}

- (BOOL)testVowelCapitalization
{
	NSString *vowelCapSample  = @"Aa";
	NSString *vowelCapAnswer  = @"AA";
	
	NSString *testArray = [vowelCapSample capSort];
	
	return [testArray isEqualToString:vowelCapAnswer];
}

-(BOOL)testConsonantCapitalization
{
	NSString *consonantCapSample  = @"bB";
	NSString *consonantCapAnswer  = @"bb";
	
	NSString *testArray = [consonantCapSample capSort];
	
	return [testArray isEqualToString:consonantCapAnswer];
}

-(BOOL)testVowelCoverage
{
	NSString *vowelCoverageSample  = @"aeiouy";
	NSString *vowelCoverageAnswer  = @"YUOIEA";
	
	NSString *testArray = [vowelCoverageSample capSort];
	
	return [testArray isEqualToString:vowelCoverageAnswer];
}

-(BOOL)testConsonantCoverage
{
	NSString *consonantCoverageSample  = @"BCDFGHJKLMNPQRSTVWXZ";
	NSString *consonantCoverageAnswer  = @"zxwvtsrqpnmlkjhgfdcb";
	
	NSString *testArray = [consonantCoverageSample capSort];
	
	return [testArray isEqualToString:consonantCoverageAnswer];
}

@end
