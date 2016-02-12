//
//  ResultViewController.swift
//  GachaTech
//
//  Created by SEKINE YURI on 2016/02/09.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

import UIKit
import AVFoundation

class ResultViewController: UIViewController {
    
    //一番後ろの背景画像を表示するためのUIImageView
    @IBOutlet var haikeiImageView: UIImageView!
    
    //一番表面のモンスター画像を表示するためのUIImageView
    @IBOutlet var monsterImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    //モンスター画像を保存しておくUIImageの型の配列
    var monsterArray: [UIImage]!
    
    //モンスターの名前を保存
    var nameArray: [AnyObject] = []
    
    var audioPlayer: AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let soundFilePath = NSBundle.mainBundle().pathForResource("shine", ofType: "wav")!
        let fileURL = NSURL(fileURLWithPath: String(soundFilePath))
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: fileURL)
        } catch {
            print("音楽ファイルが読み込めませんでした")
        }
        audioPlayer.play()
        
        //0から9の間でランダムにInt型の数字を発生させる
        let number = Int(rand() % 10)
        
        //monsterArray配列に画像を10枚追加（保存）する
        monsterArray = [UIImage(named: "monster001.png")!,
                UIImage(named: "monster002.png")!,
                UIImage(named: "monster003.png")!,
                UIImage(named: "monster004.png")!,
                UIImage(named: "monster005.png")!,
                UIImage(named: "monster006.png")!,
                UIImage(named: "monster007.png")!,
                UIImage(named: "monster008.png")!,
                UIImage(named: "monster009.png")!,
                UIImage(named: "monster010.png")!
        ]
        
        //nameArray配列に名前を追加
        nameArray = ["にゃん吉","フィシュ子", "へんないきもの", "エンジェルポイズン", "青の剣士", "レッドドラゴン", "影の支配者", "ゴールディン", "四手観音", "ゴールドスラッシュファイター"]
        
        //monsterArrayの中のnumber番目を表示させる（ランダムに表示させる）
        monsterImageView.image = monsterArray[number]
        
        //nameArrayのnumber番目を表示
        nameLabel.text = nameArray[number] as! String
        
        //numberの数字により背景画像を切り替える
        if number == 9 {
            haikeiImageView.image = UIImage(named: "bg_gold.png")
        } else if number > 6 {
            haikeiImageView.image = UIImage(named: "bg_red.png")
        } else {
            haikeiImageView.image = UIImage(named: "bg_blue.png")
        }
            
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        //アニメーションの中でもtransform(変形)させるキーパスを指定
        let animation = CABasicAnimation(keyPath: "transform")
        
        //アニメーションの開始時の数値
        animation.fromValue = NSNumber(double: 0)
        
        //アニメーション終了時の数値（M_PIとは角度の180度）
        animation.toValue = NSNumber(double: 2 * M_PI)
        
        //Z軸を中心としたアニメーションにする
        animation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        
        //アニメーションの速さを指定する
        animation.duration = 5
        
        //アニメーションを何回繰り返すか決める（今回の場合は無限に繰り返す）
        animation.repeatCount = Float.infinity
        
        //どのレイヤーをアニメーションにさせるか指定する
        haikeiImageView.layer.addAnimation(animation, forKey: nil)
        
        
        let monsterAnimation = CABasicAnimation(keyPath: "transform") //
        monsterAnimation.fromValue = NSNumber(double: -(M_PI / 3))
        monsterAnimation.toValue = NSNumber(double: M_PI / 3)
        monsterAnimation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        monsterAnimation.duration = 10
        monsterAnimation.repeatCount = 1
        
        monsterImageView.layer.addAnimation(monsterAnimation, forKey: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func modoru() {
        //前の画面に戻るための処理
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
