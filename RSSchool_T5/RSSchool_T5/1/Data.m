//
//  Data.m
//  RSSchool_T5
//
//  Created by Volha Bychok on 03/05/2020.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Data.h"

@implementation Data

- (id) initWithLength: (int)length code: (int)code andCountry: (NSString*)country {
    if (self) {
        self.length = length;
        self.code = code;
        self.country = country;
    }
    return self;
}

@end
