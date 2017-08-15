//
//  Photos.m
//  Cats(*P)
//
//  Created by Mohammad Shahzaib Ather on 2017-08-14.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

#import "Photos.h"

@implementation Photos
-(void)createImagefromDict:(NSDictionary*)inpDict
{
    
    self.farm = [inpDict valueForKey:@"farm"];
    self.identifier = [inpDict valueForKey:@"id"];
    self.isfamily = [inpDict valueForKey:@"isfamily"];
    self.isfriend = [inpDict valueForKey:@"isfriend"];
    self.ispublic = [inpDict valueForKey:@"ispublic"];
    self.owner = [inpDict valueForKey:@"owner"];
    self.secret = [inpDict valueForKey:@"secret"];
    self.server = [inpDict valueForKey:@"server"];
    self.title = [inpDict valueForKey:@"title"];
    
    
    
    
    
    self.urlString = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg" ,
                      self.farm,self.server , self.identifier, self.secret];
    
    
    self.imgData = [[ NSData alloc] initWithContentsOfURL:[NSURL URLWithString:self.urlString]];
}

@end
