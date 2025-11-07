//
//  ViewController.swift
//  Spotify_MusicPlayer
//
//  Created by Rasul Turumov on 07.11.2025.
//

import UIKit
import AVFoundation

struct Track {
    let title: String
    let artist: String
    let coverImage: String
    let audioFile: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var tracks: [Track] = [
            Track(title: "Танцуй", artist: "Масло Черного Тмина", coverImage: "mcht", audioFile: "mcht.mp3"),
            Track(title: "Любовь HD1080", artist: "Каспийский Груз", coverImage: "hd1080", audioFile: "hd1080.mp3"),
            Track(title: "Beautiful", artist: "Eminem", coverImage: "eminem", audioFile: "eminem.mp3"),
            Track(title: "Незаметно", artist: "Масло Черного Тмина", coverImage: "mcht2", audioFile: "mcht2.mp3"),
            Track(title: "Type Shit", artist: "Future, Metro Boomin, Travis Scott, Playboi Carti", coverImage: "typeshit", audioFile: "typeshit.mp3")
        ]
    
    var currentTrackIndex = 0
    var player: AVAudioPlayer?
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadTrack(at: currentTrackIndex)
        view.backgroundColor = UIColor.systemGray5
        stackView.layer.backgroundColor = UIColor.white.cgColor
        stackView.layer.cornerRadius = 12
        stackView.layer.masksToBounds = true
    }
        
    func setupUI() {

        progressSlider.minimumValue = 0
        progressSlider.maximumValue = 1
        progressSlider.value = 0
        progressSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        
        coverImageView.layer.cornerRadius = 10
        coverImageView.clipsToBounds = true
        }
        
        func loadTrack(at index: Int) {
        guard tracks.indices.contains(index) else { return }
        let track = tracks[index]
            
        titleLabel.text = track.title
        artistLabel.text = track.artist
        coverImageView.image = UIImage(named: track.coverImage)
            
        if let url = Bundle.main.url(forResource: track.audioFile.replacingOccurrences(of: ".mp3", with: ""), withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.prepareToPlay()
                durationLabel.text = formatTime(player?.duration ?? 0)
                progressSlider.value = 0
                currentTimeLabel.text = "0:00"
            } catch {
                print("Error loading audio: \(error)")
            }
        }
    }
        
    func formatTime(_ seconds: TimeInterval) -> String {
        let mins = Int(seconds) / 60
        let secs = Int(seconds) % 60
        return String(format: "%d:%02d", mins, secs)
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
        
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
        
    @objc func updateProgress() {
        guard let player = player else { return }
        let current = player.currentTime
        let duration = player.duration
        progressSlider.value = Float(current / duration)
        currentTimeLabel.text = formatTime(current)
    }
    
    @IBAction func previousTapped(_ sender: UIButton) {
        currentTrackIndex = (currentTrackIndex - 1 + tracks.count) % tracks.count
        loadTrack(at: currentTrackIndex)
        player?.play()
        startTimer()
        playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
    }
    
    @IBAction func playPauseTapped(_ sender: UIButton) {
        guard let player = player else { return }
        if player.isPlaying {
            player.pause()
            stopTimer()
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player.play()
            startTimer()
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    
    @IBAction func nextTapped(_ sender: UIButton) {
        currentTrackIndex = (currentTrackIndex + 1) % tracks.count
        loadTrack(at: currentTrackIndex)
        player?.play()
        startTimer()
        playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        guard let player = player else { return }
        player.currentTime = TimeInterval(sender.value) * player.duration
        currentTimeLabel.text = formatTime(player.currentTime)
    }
}

