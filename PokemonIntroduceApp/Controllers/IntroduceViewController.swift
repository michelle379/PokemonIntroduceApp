//
//  IntroduceViewController.swift
//  PokemonIntroduceApp
//
//  Created by 王宜婕 on 2024/8/13.
//

import UIKit
import SpriteKit

class IntroduceViewController: UIViewController {
    @IBOutlet weak var PokemonImageView: UIImageView!
    @IBOutlet weak var PokemonNumberLabel: UILabel!
    @IBOutlet weak var PokemonNameLabel: UILabel!
    @IBOutlet weak var PokemonTypeLabel: UILabel!
    @IBOutlet weak var PokemonCharacterLabel: UILabel!
    @IBOutlet weak var PokemonPropertyLabel: UILabel!
    
    var countNumber: Int = 0
    

    var selectedpokemon: Pokemon!
    var testnum : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //starParticle
        flowstars()
        //line
        drawLine()
        updateUI()
//        countNumber = selectedpokemon.number
        
    }
    func updateUI(){
        PokemonImageView.image = UIImage(named: selectedpokemon!.imagename)
        PokemonNameLabel.text = selectedpokemon?.名稱
        PokemonTypeLabel.text = selectedpokemon?.分類
        PokemonCharacterLabel.text = selectedpokemon?.特性
        PokemonPropertyLabel.text = selectedpokemon?.屬性.joined(separator: ",")
        PokemonNumberLabel.text = selectedpokemon?.編號
    }
    
    
    
    func flowstars(){
        //設定粒子
        let starEmitterCell = CAEmitterCell()
        starEmitterCell.contents = UIImage(named: "star")?.cgImage
        //發射頻率
        starEmitterCell.birthRate = 5
        //存活時間
        starEmitterCell.lifetime = 2
        //速度
//        starEmitterCell.velocity = 0
        //縮放大小
        starEmitterCell.scale = 0.2
        starEmitterCell.scaleRange = 0.4
        //加速度
        starEmitterCell.yAcceleration = 100
        //角度
        starEmitterCell.emissionRange = CGFloat.pi
        
        //設定畫面
        let starEmitterLayer = CAEmitterLayer()
        starEmitterLayer.emitterCells = [starEmitterCell]
        starEmitterLayer.emitterPosition = CGPoint(x: 200, y: 170)
        starEmitterLayer.emitterSize = CGSize(width: 200, height: 0)
        starEmitterLayer.emitterShape = .cuboid
        view.layer.addSublayer(starEmitterLayer)
    }

    
    func drawLine(){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 560))
        path.addLine(to: CGPoint(x: 50, y: 560))
        path.addLine(to: CGPoint(x: 80, y: 510))
        path.addLine(to: CGPoint(x: 320, y: 510))
        path.addLine(to: CGPoint(x: 350, y: 560))
        path.addLine(to: CGPoint(x: view.bounds.width, y: 560))
            
        let line1 = CAShapeLayer()
        line1.path = path.cgPath
        line1.fillColor = UIColor.clear.cgColor
        line1.strokeColor = UIColor.black.cgColor
        line1.lineWidth = 3
        view.layer.addSublayer(line1)
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 0, y: 760))
        path2.addLine(to: CGPoint(x: 50, y: 760))
        path2.addLine(to: CGPoint(x: 80, y: 810))
        path2.addLine(to: CGPoint(x: 320, y: 810))
        path2.addLine(to: CGPoint(x: 350, y: 760))
        path2.addLine(to: CGPoint(x: view.bounds.width, y: 760))

            
        let line2 = CAShapeLayer()
        line2.path = path2.cgPath
        line2.fillColor = UIColor.clear.cgColor
        line2.strokeColor = UIColor.black.cgColor
        line2.lineWidth = 3
        view.layer.addSublayer(line2)
    }


    @IBAction func LastButtonTapped(_ sender: Any) {
        if countNumber > 0 {
            countNumber -= 1
            selectedpokemon = Pokemons[countNumber]
            updateUI()
        }

        
    }
    @IBAction func NextButtonTapped(_ sender: Any) {
        if countNumber < Pokemons.count - 1{
            countNumber += 1
            selectedpokemon = Pokemons[countNumber]
            updateUI()
        }
        
    }

}
//#Preview{
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    return storyboard.instantiateViewController(withIdentifier: "IntroduceViewController")
//}
//
//
//
