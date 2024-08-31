//
//  LoginViewController.swift
//  PokemonIntroduceApp
//
//  Created by 王宜婕 on 2024/8/13.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    
    @IBAction func unwindToLoginViewController(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bkColor()
        //ani
        pokeballAni()

    }
    func bkColor(){
        backgroundView.layer.borderWidth=3
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = backgroundView.bounds
        gradientLayer.colors = [UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor, UIColor(red: 139/255, green: 0, blue: 0, alpha: 1).cgColor]
        backgroundView.layer.addSublayer(gradientLayer)
    }
    
    func pokeballAni(){
        let pokeballView = UIImageView(frame: CGRect(x: 280, y: 420, width: 130, height: 130))
        let pokeballImage = UIImage.animatedImageNamed("pkball-", duration: 4)
        pokeballView.image = pokeballImage
        view.addSubview(pokeballView)
    }


}

#Preview {
    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
}
