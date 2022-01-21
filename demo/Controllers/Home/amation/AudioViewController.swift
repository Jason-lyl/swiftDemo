//
//  AudioViewController.swift
//  demo
//
//  Created by Jason on 2022/1/17.
//  Copyright © 2022 youzy. All rights reserved.
//

import UIKit
import AVFoundation
import AVFAudio

class AudioViewController: UIViewController {
    var audioEngine = AVAudioEngine()
    var audioData = Data()

    override func viewDidLoad() {
        super.viewDidLoad()
        AVAudioCommonFormat.pcmFormatInt16
        guard let outputFormat = AVAudioFormat(commonFormat: .pcmFormatInt16, sampleRate: 16_000, channels: AVAudioChannelCount(1), interleaved: false) else {
            return
        }
        let inputFormat = self.audioEngine.inputNode.outputFormat(forBus: 0)
        let converter = AVAudioConverter(from: inputFormat, to: outputFormat)
    }


}
