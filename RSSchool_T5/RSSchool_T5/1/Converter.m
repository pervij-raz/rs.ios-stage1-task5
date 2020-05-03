#import "Converter.h"
#import "Data.h"

// Do not change
NSString *KeyPhoneNumber = @"phoneNumber";
NSString *KeyCountry = @"country";

@implementation PNConverter


- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string; {
    if ([string hasPrefix:@"+"]) {
        string = [string substringFromIndex:1];
    }
    NSString *codeResult = [NSString new];
    codeResult = @"";
    NSMutableString *result = [[NSMutableString alloc] initWithString:string];
    Data *ru = [[Data alloc] initWithLength:10 code:7 andCountry:@"RU"];
    Data *kz = [[Data alloc] initWithLength:10 code:77 andCountry:@"KZ"];
    Data *md = [[Data alloc] initWithLength:8 code:373 andCountry:@"MD"];
    Data *am = [[Data alloc] initWithLength:8 code:374 andCountry:@"AM"];
    Data *by = [[Data alloc] initWithLength:9 code:375 andCountry:@"BY"];
    Data *ua = [[Data alloc] initWithLength:9 code:380 andCountry:@"UA"];
    Data *tj = [[Data alloc] initWithLength:9 code:992 andCountry:@"TJ"];
    Data *tm = [[Data alloc] initWithLength:8 code:993 andCountry:@"TM"];
    Data *az = [[Data alloc] initWithLength:9 code:994 andCountry:@"AZ"];
    Data *kg = [[Data alloc] initWithLength:9 code:996 andCountry:@"KG"];
    Data *uz = [[Data alloc] initWithLength:9 code:998 andCountry:@"UZ"];
    NSArray *data = [[NSArray alloc] initWithObjects: kz, ru, md, am, by, ua, tj, tm, az, kg, uz, nil];
    for (int i = 0; i < data.count; i++) {
        Data *d = [data objectAtIndex:i];
        if ([string hasPrefix:[NSString stringWithFormat:@"%d", d.code]]) {
            codeResult = d.country;
            if (d.length == 8 || d.length == 9) {
                if ([result length] > 3) {
                [result insertString:@" (" atIndex:3];
                }
                if ([result length] > 7) {
                [result insertString:@") " atIndex:7];
                }
                if ([result length] > 12) {
                [result insertString:@"-" atIndex:12];
                }
                if (d.length == 8 && [result length] > 15) {
                    [result substringToIndex:15];
                }
                if (d.length == 8 && [result length] > 17) {
                NSString *ab = [result substringToIndex:16];
                    result = [NSMutableString stringWithString:ab];
                    break;
                }
                if (d.length == 9 && [result length] > 15) {
                [result insertString:@"-" atIndex:15];
                }
                if (d.length == 9 && [result length] > 18) {
                NSString *ab = [result substringToIndex:18];
                    result = [NSMutableString stringWithString:ab];
                    break;
                }
                
            } else if (d.length == 10) {
                if ([result length] > 1) {
                [result insertString:@" (" atIndex:1];
                }
                if ([result length] > 6) {
                [result insertString:@") " atIndex:6];
                }
                if ([result length] > 11) {
                [result insertString:@"-" atIndex:11];
                }
                if ([result length] > 14) {
                [result insertString:@"-" atIndex:14];
                }
                if  ([result length] > 18) {
                NSString *ab = [result substringToIndex:17];
                    result = [NSMutableString stringWithString:ab];
                    break;
                } else {
                    break;
                }
            }
        }
    }
    if (codeResult == [[NSString alloc] initWithString:@""] && [result length] > 13) {
        NSString *ab = [result substringToIndex:12];
        result = [NSMutableString stringWithString:ab];
    }
    [result insertString:@"+" atIndex:0];
    return @{KeyPhoneNumber: result,
             KeyCountry: codeResult};
}
@end
