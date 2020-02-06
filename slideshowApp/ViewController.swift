//
//  ViewController.swift
//  slideshowApp
//
//  Created by Apple on 2020/02/03.
//  Copyright © 2020 ryotaro.tsuji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var GoAndStopTitle: UIButton!
    
    
    var timer: Timer?

//    画像の読み込み
    let image1:UIImage = UIImage(named: "254A22D5-D9BF-4F97-BA26-49F408537DE3_1_105_c.jpeg")!
    let image2:UIImage = UIImage(named: "86C51464-8468-42DD-A5F6-28FBEF191E20_1_105_c.jpeg")!
    let image3:UIImage = UIImage(named: "5365CACC-22AE-4F86-8D67-E689E6998ACC_1_105_c.jpeg")!
    let image4:UIImage = UIImage(named: "5931670E-164D-498E-8C2A-83B069C630A9_1_105_c.jpeg")!
    let image5:UIImage = UIImage(named: "61AE47A4-7F06-4D4D-B886-713E7248F84B_1_105_c.jpeg")!
//    画像変更の関数
     @objc func changePhoto() {
        if myImageView.image == image1 {
                   myImageView.image = image2
               } else if myImageView.image == image2 {
                   myImageView.image = image3
        } else if myImageView.image == image3 {
            myImageView.image = image4
        } else if myImageView.image == image4 {
            myImageView.image = image5
        } else {
            myImageView.image = image1
        }
    }
    
//    現在の状態は？ 再生or停止 　　　1=停止中　2=再生中
    var GOorStop = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        myImageViewの初期値
        myImageView.image = image1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController:NextViewController = segue.destination as! NextViewController
        
        if myImageView.image == image1 {
            nextViewController.image6 = image1
        } else if myImageView.image == image2 {
            nextViewController.image6 = image2
        } else if myImageView.image == image3 {
            nextViewController.image6 = image3
        } else if myImageView.image == image4 {
            nextViewController.image6 = image4
        } else {
            nextViewController.image6 = image5
        }
    }
    
    

//    進むボタンの設定
    @IBAction func nextButton(_ sender: UIButton) {
        if GOorStop == 1 {
        changePhoto()
        }
    }
    
//    戻るボタンの設定
    @IBAction func backButton(_ sender: UIButton) {
        if GOorStop == 1 {
        if myImageView.image == image1 {
            myImageView.image = image5
        } else if myImageView.image == image5 {
            myImageView.image = image4
        } else if myImageView.image == image4 {
            myImageView.image = image3
        } else if myImageView.image == image3 {
            myImageView.image = image2
        } else {
            myImageView.image = image1
            }
        }
    }
    
    
//  再生、停止ボタンの設定
    @IBAction func GoAndStopButton(_ sender: UIButton) {
        if GOorStop == 1 {
                 GOorStop = 2
            GoAndStopTitle.setTitle("停止", for: .normal)
            } else {
                 GOorStop = 1
            GoAndStopTitle.setTitle("再生", for: .normal)
             }
             
             if GOorStop == 2 {
             timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changePhoto), userInfo: nil, repeats: true)
             } else {
                 timer?.invalidate()
             }
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }

}

