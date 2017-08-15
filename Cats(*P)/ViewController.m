//
//  ViewController.m
//  Cats(*P)
//
//  Created by Mohammad Shahzaib Ather on 2017-08-14.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//
#import "Photos.h"
#import "ViewController.h"
#import "CollectionViewCell.h"
@interface ViewController ()<UICollectionViewDelegate ,UICollectionViewDataSource>

@property NSMutableArray<Photos *> *photos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.title = @"Cats";
    
    self.photos = [NSMutableArray new];
    
    
    
    self.collectionView.dataSource =self;
    
    
    
    
    NSURL *url = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=b5345f47591870b11677c140e7dbf415&tags=cat"];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error) {
            
            NSLog(@"Error getting data");
        } else {
            
            NSError *jsonError = nil;
            NSDictionary *jsonDicData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            if (jsonError) {
                NSLog(@"jsonError: %@", jsonError.localizedDescription);
            } else {
                
                NSDictionary * photos = [jsonDicData objectForKey:@"photos"];
                NSMutableArray * imagesArray = [photos objectForKey:@"photo"];
                
                
                
                
                
                
                
                for ( int i = 0 ; i < imagesArray.count ; i++){
                    
                    Photos* photo = [Photos new];
                    
                    NSDictionary * eachImgDict = [imagesArray objectAtIndex:i];
                    
                    [photo createImagefromDict:eachImgDict];
                    
                    [self.photos addObject:photo];
                    
                    
                }
                
                
                
                dispatch_async(dispatch_get_main_queue(), ^{
                   [self.collectionView reloadData];
                });
                
            }
        }
        
    }];
    
    [dataTask resume];
    
    NSLog(@"view did load");
    

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    
    
    Photos *object = self.photos[indexPath.row];
    
   cell.imageView.image = [UIImage imageWithData:object.imgData];
    cell.nameLabel.text = object.title;
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.photos.count;
}
@end
