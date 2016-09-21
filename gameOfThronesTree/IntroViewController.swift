//
//  IntroViewController.swift
//  gameOfThronesTree
//
//  Created by Tom Eastman on 9/21/16.
//  Copyright © 2016 Tom Eastman. All rights reserved.
//

import UIKit
import Foundation
import AVKit
import AVFoundation

class IntroViewController: UIViewController {

    var backgroundMusicPlayer: AVAudioPlayer!
    
    func playBackgroundMusic() {
        
        //The location of the file and its type
        let url = Bundle.main.url(forResource: "GameOfThronesThemeSong", withExtension: "mp3")
        
        //Returns an error if it can't find the file name
        if (url == nil) {
            print("Could not find the file")
        }
        
        //Assigns the actual music to the music player
        do {
            try backgroundMusicPlayer = AVAudioPlayer(contentsOf: url!)
        }
        
        //Error if it failed to create the music player
        catch{
            print("Could not create audio player: \(error)")
            return
        }
        
        //A negative means it loops forever
        backgroundMusicPlayer.numberOfLoops = -1
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
    }
    

    override func viewDidLoad() {
        playBackgroundMusic()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
