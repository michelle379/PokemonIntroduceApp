//
//  SelectedViewController.swift
//  PokemonIntroduceApp
//
//  Created by 王宜婕 on 2024/10/27.
//

import UIKit

class SelectedViewController: UIViewController {
    
    @IBOutlet var PokemonButtons: [UIButton]!
    
    @IBOutlet weak var PokemonPageControl: UIPageControl!
    @IBOutlet weak var PokemonSegmentControl: UISegmentedControl!
    @IBAction func unwindToSelect(_ unwindSegue: UIStoryboardSegue) {
    }
    
    var currrentIndex: Int = 0
    var currentPokemons = Pokemons
    var sixPokemons: [Pokemon] = []
    var pagecount: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fires.removeAll()
        waters.removeAll()
        moods.removeAll()
        elecs.removeAll()
        typeAdd()
        updateUI()
        
    }
    func updateUI(){
        setButton()
        PokemonPageControl.currentPage = currrentIndex
        PokemonPageControl.numberOfPages = pagecount + 1
    }
    
    func setPokemons(){
        print(currrentIndex)
        
        if currentPokemons.count > 6{
            sixPokemons.removeAll()
            var num = 6 * currrentIndex
            
            if currrentIndex == currentPokemons.count / 6{
                for i in num..<num + currentPokemons.count % 6 {
                    sixPokemons.append(currentPokemons[i])
                }
            }else{
                for i in num..<num + 6{
                    sixPokemons.append(currentPokemons[i])
                }
            }
            currentPokemons = sixPokemons
            updateUI()
        }

    }
    
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }

    func setButton(){
        let nownum = currentPokemons.count
        if nownum < 6 {
            for i in 0..<3 {
                PokemonButtons[i].isHidden = false
            }
            for j in nownum..<6{
                PokemonButtons[j].isHidden = true
            }
            for index in 0..<currentPokemons.count{
                let resizedImage = resizeImage(image: UIImage(named: currentPokemons[index].imagename)!, targetSize: CGSize(width: 120, height: 120)) // 調整尺寸
                PokemonButtons[index].setImage(resizedImage, for: .normal)
                PokemonButtons[index].imageView?.contentMode = .scaleAspectFit
     
            }
        }else {
            PokemonButtons.forEach { $0.isHidden = false }
            
            for index in 0..<6{
                let resizedImage = resizeImage(image: UIImage(named: currentPokemons[index].imagename)!, targetSize: CGSize(width: 120, height: 120)) // 調整尺寸
                PokemonButtons[index].setImage(resizedImage, for: .normal)
                PokemonButtons[index].imageView?.contentMode = .scaleAspectFit
     
            }
        }

    }
    
    
    
    @IBAction func ShowNext(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowDetail", sender: sender)
    }
    
    
    @IBSegueAction func ShowDetail(_ coder: NSCoder) -> IntroduceViewController? {
        let controller = IntroduceViewController(coder: coder)
        return controller
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let introduceVC = segue.destination as? IntroduceViewController,
               let button = sender as? UIButton {
                switch button {
                case PokemonButtons[0]:
                    introduceVC.selectedpokemon = currentPokemons[0]
                case PokemonButtons[1]:
                    introduceVC.selectedpokemon = currentPokemons[1]
                case PokemonButtons[2]:
                    introduceVC.selectedpokemon = currentPokemons[2]
                case PokemonButtons[3]:
                    introduceVC.selectedpokemon = currentPokemons[3]
                case PokemonButtons[4]:
                    introduceVC.selectedpokemon = currentPokemons[4]
                case PokemonButtons[5]:
                    introduceVC.selectedpokemon = currentPokemons[5]
                default: break
                }
            }
        }
    }
    
    @IBAction func PageChanged(_ sender: Any) {
        currrentIndex = PokemonPageControl.currentPage
        updateUI()
        
    }
    @IBAction func LastButton(_ sender: Any) {
        currrentIndex = (currrentIndex + (currentPokemons.count / 6 )) % (currentPokemons.count / 6 + 1)
        choosePokemon()
        updateUI()
        setPokemons()
    }
    
    fileprivate func choosePokemon() {
        switch PokemonSegmentControl.selectedSegmentIndex{
        case 0:
            currentPokemons = Pokemons
        case 1:
            currentPokemons = moods
        case 2:
            currentPokemons = fires
        case 3:
            currentPokemons = waters
        case 4:
            currentPokemons = elecs
        default:
            break
        }
    }
    
    @IBAction func TypeSelected(_ sender: Any) {
        choosePokemon()
        pagecount = currentPokemons.count / 6
        updateUI()
        
    }
    
    @IBAction func NextButton(_ sender: Any) {
        currrentIndex = (currrentIndex + 1) % (currentPokemons.count / 6 + 1)
        choosePokemon()
        updateUI()
        setButton()
        setPokemons()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
#Preview{
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //withIdentifier內打入View名稱
    return storyboard.instantiateViewController(withIdentifier: "SelectedViewController")
}


