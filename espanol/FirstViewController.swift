//
//  FirstViewController.swift
//  espanol
//
//  Created by ChenHao on 16/3/29.
//  Copyright © 2016年 HarriesChen. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UICollectionViewController, AVAudioPlayerDelegate {
    var audioPlayer: AVAudioPlayer! // Global variable
    var currentIndex: Int = 1
    
    var dataSource: [(latter: String, soundmark:String)] = [
    ("A a","/a/"),
    ("B b","/be/"),
    ("C c","/ce/"),
    ("Ch ch","/che/"),
    ("D f","/de/"),
    ("E e","/e/"),
    ("F f","/efe/"),
    ("G h","/ge/"),
    ("H h","/hache/"),
    ("I i","/i/"),
    ("J j","/jota/"),
    ("K k","/ka/"),
    ("L l","/ele/"),
    ("Ll ll","/elle/"),
    ("M m","/eme/"),
    ("N n","/ene/"),
    ("Ñ ñ","/eñe/"),
    ("O o","/o/"),
    ("P p","/pe/"),
    ("Q q","/cu/"),
    ("R r","/ere/"),
    ("RR rr","/erre/"),
    ("S s","/ese/"),
    ("T t","/te/"),
    ("U u","/u/"),
    ("V v","/uve/"),
    ("W w","/uve/"),
    ("X x","/ekis/"),
    ("Y y","/ygriege/"),
    ("Z z","/zeta/")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "字母发音表"
    }
    
    func audioPlayerEndInterruption(player: AVAudioPlayer, withFlags flags: Int) {
        
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
    }
    
    func start() {
        playAudio(1)
    }

    func playAudio(index: Int) {
        let path = NSBundle.mainBundle().pathForResource("\(index)", ofType: "mp3")
        do {
            let url = NSURL(fileURLWithPath: path!)
            audioPlayer = try AVAudioPlayer(contentsOfURL: url)
            audioPlayer.delegate = self
            audioPlayer.play()
        } catch {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension FirstViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellIdentifer", forIndexPath: indexPath) as! LatterCell
        let data = dataSource[indexPath.row]
        cell.LatterLabel.text = data.latter
        cell.SoundMarkLabel.text = data.soundmark
        cell.layer.cornerRadius = 8
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        playAudio(indexPath.row + 1)
    }

}

