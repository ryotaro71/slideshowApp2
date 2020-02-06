//
//  NextViewController.swift
//  slideshowApp
//
//  Created by Apple on 2020/02/04.
//  Copyright © 2020 ryotaro.tsuji. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var bigImageView: UIImageView!
    
    var image6:UIImage!
    

   
    
    
//    画像の拡大
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bigImageView.image = image6
    }
    

   
}
