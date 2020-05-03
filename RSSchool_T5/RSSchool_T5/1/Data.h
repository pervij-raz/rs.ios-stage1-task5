//
//  Data.h
//  RSSchool_T5
//
//  Created by Volha Bychok on 03/05/2020.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data: NSObject

@property (nonatomic, assign) int length;
@property (nonatomic, assign) int code;
@property (nonatomic, strong) NSString *country;

- (id) initWithLength: (int)length code: (int)code andCountry: (NSString*)country;

@end
    


