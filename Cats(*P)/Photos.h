//
//  Photos.h
//  Cats(*P)
//
//  Created by Mohammad Shahzaib Ather on 2017-08-14.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photos : NSObject



@property (nonatomic) NSString *farm;
@property (nonatomic) NSString *identifier;
@property (nonatomic) NSString *isfamily;
@property (nonatomic) NSString *isfriend;
@property (nonatomic) NSString *ispublic;
@property (nonatomic) NSString *owner;
@property (nonatomic) NSString *secret;
@property (nonatomic) NSString *server;
@property (nonatomic) NSString *title;

@property (nonatomic) NSString *urlString;
@property (nonatomic) NSData *imgData;




-(void)createImagefromDict:(NSDictionary*)inpDict;


@end
