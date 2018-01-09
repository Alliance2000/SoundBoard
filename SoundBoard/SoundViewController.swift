//
//  SoundViewController.swift
//  SoundBoard
//
//  Created by Marcus Jessnitz on 08.01.18.
//  Copyright © 2018 Marcus Jessnitz. All rights reserved.
//

import UIKit
import AVFoundation


class SoundViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    var audioRecorder : AVAudioRecorder?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRecorder()
    }

    
    func setupRecorder() {
        do {
        // create an audio session
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.overrideOutputAudioPort(.speaker)
            try session.setActive(true)
        
        // create URL for the audio file
            let basePath : String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let pathComponents = [basePath, "audio.m4a"]
            let audioURL = NSURL.fileURL(withPathComponents: pathComponents)!
        
        // create settings for the audioRecorder
            var settings : [String:Any] = [:]
            settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC)
            settings[AVSampleRateKey] = 44100.0
            settings[AVNumberOfChannelsKey] = 2
        
        // create audioRecorder object
        audioRecorder = try AVAudioRecorder(url: audioURL, settings: settings)
            audioRecorder!.prepareToRecord()
        } catch let error as NSError {
            print(error)
        }
    }
    
    
    @IBAction func recordTapped(_ sender: Any) {
        
    }
    
    
    @IBAction func playTapped(_ sender: Any) {
        
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        
    }
    
    
}
