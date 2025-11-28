//
//  ViewController.swift
//  HeroesApp
//
//  Created by Rassul Turumov on 29.11.2025.
//

import UIKit
import Kingfisher

extension UserDefaults {
    private enum Keys {
        static let lastHero = "lastHero"
    }
    
    func saveHero(_ hero: HeroModel) {
        if let data = try? JSONEncoder().encode(hero) {
            set(data, forKey: Keys.lastHero)
        }
    }
    
    func loadHero() -> HeroModel? {
        guard let data = data(forKey: Keys.lastHero),
              let hero = try? JSONDecoder().decode(HeroModel.self, from: data) else {
            return nil
        }
        return hero
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var durability: UILabel!
    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var combat: UILabel!
    @IBOutlet weak var intelligence: UILabel!
    @IBOutlet weak var strength: UILabel!
    @IBOutlet weak var rollButton: UIButton!
    
    let blurredBackground = UIImageView()
    let service = HeroesService()

    override func viewDidLoad() {
        super.viewDidLoad()
        blurredBackground.frame = view.bounds
        blurredBackground.contentMode = .scaleAspectFill
        blurredBackground.clipsToBounds = true
        view.insertSubview(blurredBackground, at: 0)
        let blur = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurredBackground.addSubview(blurView)
        heroImage.layer.cornerRadius = 20
        if let lastHero = UserDefaults.standard.loadHero() {
                configureHero(hero: lastHero)
            } else {
                didRoll(self)
            }
    }
            
    func configureHero(hero: HeroModel) {
        heroName.text = hero.name
        weight.text = hero.appearance.weight.last
        height.text = hero.appearance.height.last
        speed.text = "\(hero.powerstats.speed)"
        durability.text = "\(hero.powerstats.durability)"
        power.text = "\(hero.powerstats.power)"
        combat.text = "\(hero.powerstats.combat)"
        intelligence.text = "\(hero.powerstats.intelligence)"
        strength.text = "\(hero.powerstats.strength)"

        if let url = URL(string: hero.images.lg) {
            heroImage.kf.setImage(with: url, placeholder: UIImage(systemName: "person.fill"))
            blurredBackground.kf.setImage(with: url)
        } else {
            heroImage.image = UIImage(systemName: "person.fill")
            blurredBackground.image = nil
        }
    }
    
    

    @IBAction func didRoll(_ sender: Any){
        Task { @MainActor in
            var hero: HeroModel? = nil
            repeat {
                let randomId = Int.random(in: 1...731)
                do {
                    hero = try await service.fetchHero(id: randomId)
                } catch {
                    if let urlError = error as? URLError {
                        print("Error: \(urlError)")
                    }
                    continue
                }
                
            } while hero == nil
        
            UIView.animate(withDuration: 0.3, animations: {
                            self.heroImage.alpha = 0
                            self.heroName.alpha = 0
                            self.weight.alpha = 0
                            self.height.alpha = 0
                            self.speed.alpha = 0
                            self.durability.alpha = 0
                            self.power.alpha = 0
                            self.combat.alpha = 0
                            self.intelligence.alpha = 0
                            self.strength.alpha = 0
            }) { _ in
                    self.configureHero(hero: hero!)
                    UserDefaults.standard.saveHero(hero!)
                            
                    UIView.animate(withDuration: 0.3) {
                            self.heroImage.alpha = 1
                            self.heroName.alpha = 1
                            self.weight.alpha = 1
                            self.height.alpha = 1
                            self.speed.alpha = 1
                            self.durability.alpha = 1
                            self.power.alpha = 1
                            self.combat.alpha = 1
                            self.intelligence.alpha = 1
                            self.strength.alpha = 1
                    }
            }
        }
    }
    
}

