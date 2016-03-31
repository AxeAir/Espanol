//
//  Layout.swift
//  espanol
//
//  Created by ChenHao on 16/3/30.
//  Copyright © 2016年 HarriesChen. All rights reserved.
//

import UIKit

class Layout: UICollectionViewFlowLayout {
    
    override func prepareLayout() {
        self.sectionInset = UIEdgeInsets(top: 30, left: 15, bottom: 5, right: 15)
        self.minimumLineSpacing = 10
        self.minimumInteritemSpacing = 10
//        let width = UIScreen.mainScreen().bounds.width - 
        self.itemSize = CGSize(width: 60, height: 60)
    }
    
}
