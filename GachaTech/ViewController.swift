//
//  ViewController.swift
//  GachaTech
//
//  Created by SEKINE YURI on 2016/02/09.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gacha() {
        //SegueのIdentifierが"result"のViewへ画面遷移する
        self.performSegueWithIdentifier("result", sender: nil)
    }


}

