//
//  SoundViewController.swift
//  StopMosquito
//
//  Created by 이서영 on 2022/06/27.
//

import Foundation
import UIKit

class SoundViewController: UIViewController {
    
    var playButton: UIButton!
    var descriptionLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayButton()
        style()
        layout()
    }
}

extension SoundViewController {
    
    private func setupPlayButton() {
        var configuartion = UIButton.Configuration.filled()
        configuartion.image = UIImage(systemName: "play.fill")
        configuartion.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        configuartion.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 80)
        configuartion.baseBackgroundColor = .white
        configuartion.baseForegroundColor = UIColor(named: "customGreen")
        configuartion.background.cornerRadius = view.frame.width * 0.3

        playButton = UIButton(configuration: configuartion)

        playButton.layer.borderColor = UIColor.systemGray5.cgColor
        playButton.layer.borderWidth = 1
        playButton.layer.cornerRadius = view.frame.width * 0.3
        playButton.layer.masksToBounds = true
        
        playButton.addTarget(self, action: #selector(playFrequencySound), for: .touchUpInside)
    }
    
    func style() {
        view.backgroundColor = UIColor(named: "background")
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.text = "모기 퇴치에 효과가 있는 주파수를 재생합니다."
        
        view.addSubview(playButton)
        view.addSubview(descriptionLabel)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 20),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            playButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: playButton.bottomAnchor, multiplier: 5),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension SoundViewController {
    @objc func playFrequencySound() {
        playButton.isSelected = !playButton.isSelected
        playButton.configurationUpdateHandler = { button in
            var config = button.configuration
            config?.image = button.isSelected ? UIImage(systemName: "pause.fill") : UIImage(systemName: "play.fill")
            button.configuration = config
        }
    }
}
