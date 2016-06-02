//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/**
 
 * Define your methods here.
 
 */

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array;{
        NSSortDescriptor *ascending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
        NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[ascending]];
    return sortedArray;}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array;{
        NSSortDescriptor *descending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
        NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[descending]];
    return sortedArray;}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array;{
        NSInteger countArray = [array count];
        NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:array];
        NSInteger arrayCountMinusOne = countArray - 1;
        NSNumber *objectFirst = array[0];
        NSNumber *objectLast = array[arrayCountMinusOne];
    
    
            [mutableArray removeObject:objectLast];
            [mutableArray removeObject:objectFirst];
    
            [mutableArray insertObject:objectLast atIndex:0];
            [mutableArray insertObject:objectFirst atIndex:arrayCountMinusOne];
    
    
    return mutableArray;}

-(NSArray *)arrayByReversingArray:(NSArray *)array;{
        NSMutableArray *mutableCopyArray = [NSMutableArray arrayWithArray:array];
        NSMutableArray *mutableReturn = [[NSMutableArray alloc]init];
   
    
        for (NSUInteger i = 0; i < [array count]; i++) {
            NSInteger arrayCount = [mutableCopyArray count];
            NSInteger arrayCountMinusOne = arrayCount - 1;
            NSNumber *objectLast = mutableCopyArray[arrayCountMinusOne];
        
            [mutableReturn addObject:objectLast];
            [mutableCopyArray removeObject:objectLast];
        }
    
    return mutableReturn;}

-(NSString *)stringInBasicLeetFromString:(NSString *)string;{
    
    string = [string stringByReplacingOccurrencesOfString:@"a" withString:@"4"];
    string = [string stringByReplacingOccurrencesOfString:@"s" withString:@"5"];
    string = [string stringByReplacingOccurrencesOfString:@"i" withString:@"1"];
    string = [string stringByReplacingOccurrencesOfString:@"l" withString:@"1"];
    string = [string stringByReplacingOccurrencesOfString:@"e" withString:@"3"];
    string = [string stringByReplacingOccurrencesOfString:@"t" withString:@"7"];
    
    return string;}

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array;{

        NSMutableArray *positives = [[NSMutableArray alloc]init];
        NSMutableArray *negatives = [[NSMutableArray alloc]init];
    
    for (NSUInteger i = 0; i < [array count]; i++) {
        NSNumber *arrayNumber = array[i];
        NSInteger numberToInt = [arrayNumber integerValue];
        
        if (numberToInt >= 0) {
            [positives addObject:arrayNumber];
        }
        else {
            [negatives addObject:arrayNumber];
        }
        
        
    }
    
        NSArray *parentArray = @[negatives, positives];
    
    return parentArray;}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary;{
        NSArray *hobbitArray = [dictionary allKeysForObject:@"hobbit"];
    return hobbitArray;}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array;{
        NSMutableArray *wordsStartingWithA = [[NSMutableArray alloc]init];
        NSMutableArray *arrayToMutable = [NSMutableArray arrayWithArray:array];
    
        for (NSUInteger i = 0; i < [arrayToMutable count]; i++) {
            NSString *firstObject = arrayToMutable[i];
            
        
            if ([[[firstObject lowercaseString] substringToIndex:1] isEqualToString:@"a"]){
                [wordsStartingWithA addObject:firstObject];
                [arrayToMutable removeObject:firstObject];
                }
            
            
        
            
        }
    
    return wordsStartingWithA;}

-(NSInteger)sumOfIntegersInArray:(NSArray *)array;{
    NSInteger addedValues = 0;
    
    for (NSUInteger i = 0; i < [array count]; i++) {
        addedValues += [[array objectAtIndex:i] integerValue];
        
    }
    return addedValues;}

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array;{
        NSMutableArray *pluralizedArray = [[NSMutableArray alloc]init];
    
   /* @"hands" ,
    @"feet"  ,
    @"knees" ,
    @"tables",
    @"boxes" ,
    @"oxen"  ,
    @"axles" ,
    @"radii" ,
    @"trivia" */
    
    for (NSUInteger i = 0; i < [array count]; i++) {
        NSString *objectToBePluralized = array[i];
        
        if ([objectToBePluralized isEqualToString:@"foot"]) {
            [pluralizedArray addObject:@"feet"];
        }
        else if ([objectToBePluralized isEqualToString:@"box"]) {
            [pluralizedArray addObject:@"boxes"];
        }
        else if([objectToBePluralized isEqualToString:@"ox"]) {
            [pluralizedArray addObject:@"oxen"];
        }
        else if ([objectToBePluralized isEqualToString:@"radius"]) {
            [pluralizedArray addObject:@"radii"];
        }
        else if ([objectToBePluralized isEqualToString:@"trivium"]) {
            [pluralizedArray addObject:@"trivia"];
        }
        else {
            [pluralizedArray addObject:[objectToBePluralized stringByAppendingString:@"s"]];}
        
    }
    
    return pluralizedArray;}
    
-(NSDictionary *)countsOfWordsInString:(NSString *)string;{
    
    string = [string stringByReplacingOccurrencesOfString:@"." withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"," withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"-" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@";" withString:@""];
    
    NSLog(@"%@", string);
    
    NSMutableArray *words = [[[string lowercaseString] componentsSeparatedByString:@" "] mutableCopy];
   
    NSLog(@"%@", words);
    
    NSMutableDictionary *solution = [[NSMutableDictionary alloc] init];
    
    while ([words count]) {
        NSMutableIndexSet *indexSet = [[NSMutableIndexSet alloc] init];
        NSString *search = [words objectAtIndex:0];
        for (NSUInteger i = 0; i < [words count]; i++) {
            if ([[words objectAtIndex:i] isEqualToString:search]) {
                [indexSet addIndex:i];
            }
        }
        [solution setObject:[NSNumber numberWithInt:[indexSet count]] forKey:search];
        [words removeObjectsAtIndexes:indexSet];
        
    }
    
    NSLog(@"%@", solution);
  

    
    
    
    return solution;}
-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array;{
    
    NSMutableDictionary *groupedDictionary = [[NSMutableDictionary alloc] init];
    NSLog(@"%@", array);
    
    NSMutableArray *coldplaySongs = [[NSMutableArray alloc] init];
    NSMutableArray *johnyyFlynnSongs = [[NSMutableArray alloc] init];
    NSMutableArray *singerSongs = [[NSMutableArray alloc] init];
    NSMutableArray *ryanAdamsSongs = [[NSMutableArray alloc] init];
    
    /*"Coldplay - Strawberry Swing",
     "Johnny Flynn - In April",
     "Coldplay - Clocks",
     "Sigur R\U00f3s - Andvari",
     "Ryan Adams - When The Stars Go Blue",
     "Coldplay - Viva la Vida",
     "Johnny Flynn - Cold Bread",
     "Sigur Rós - Glósóli",
     "Ryan Adams - La Cienega Just Smiled"*/
   
    for (NSUInteger i  = 0; i < [array count]; i++) {
        NSString *artistSearch = array[i];
        if ([artistSearch containsString:@"Coldplay"]) {
            if ([artistSearch containsString:@"Strawberry Swing"]){
                [coldplaySongs addObject:@"Strawberry Swing"];
            }
            else if ([artistSearch containsString:@"Clocks"]){
                [coldplaySongs addObject:@"Clocks"];
            }
            else if ([artistSearch containsString:@"Viva la Vida"]){
                [coldplaySongs addObject:@"Viva la Vida"];
            }
        }
        else if ([artistSearch containsString:@"Johnny Flynn"]) {
            if ([artistSearch containsString:@"In April"]){
                [johnyyFlynnSongs addObject:@"In April"];
            }
            else if ([artistSearch containsString:@"Cold Bread"]){
                [johnyyFlynnSongs addObject:@"Cold Bread"];
            }
        }
        else if ([artistSearch containsString:@"Sigur Rós"]) {
            if ([artistSearch containsString:@"Andvari"]){
                [singerSongs addObject:@"Andvari"];
            }
            else if ([artistSearch containsString:@"Glósóli"]){
                [singerSongs addObject:@"Glósóli"];
            }
        }
        else if ([artistSearch containsString:@"Ryan Adams"]) {
            if ([artistSearch containsString:@"When The Stars"]){
                [ryanAdamsSongs addObject:@"When The Stars Go Blue"];
            }
            else if ([artistSearch containsString:@"La Cienega Just Smiled"]){
                [ryanAdamsSongs addObject:@"La Cienega Just Smiled"];
            }
        }
    }
     NSLog(@"%@", coldplaySongs);
    
    NSSortDescriptor *ascending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    
    [coldplaySongs sortUsingDescriptors:@[ascending]];
    [johnyyFlynnSongs sortUsingDescriptors:@[ascending]];
    [singerSongs sortUsingDescriptors:@[ascending]];
    [ryanAdamsSongs sortUsingDescriptors:@[ascending]];
    
    [groupedDictionary setObject:coldplaySongs forKey:@"Coldplay"];
    [groupedDictionary setObject:johnyyFlynnSongs forKey:@"Johnny Flynn"];
    [groupedDictionary setObject:singerSongs forKey:@"Sigur Rós"];
    [groupedDictionary setObject:ryanAdamsSongs forKey:@"Ryan Adams"];
    
    NSLog(@"%@", groupedDictionary);
    
    return groupedDictionary;}

@end
