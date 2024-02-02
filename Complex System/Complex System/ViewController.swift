//
//  ViewController.swift
//  Complex System
//
//  Created by Hunter Jensen on 1/30/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var marbleButton: UIButton!
    @IBOutlet weak var diceButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var rollsLabel: UILabel!
    
    
    var blueMarble = Marble()
    var blackDice = Dice()
    var player1: Player?
    var player2: Player?
    var allRolls = AllRolls()
    var rollsStorage = RollsStorage()
    var logRolls: LogRolls!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player1 = Player(roll: blackDice)
        player2 = Player(roll: blueMarble)
        logRolls = LogRolls(saveRolls: allRolls)

        // Do any additional setup after loading the view.
    }
    
    func rollingTheThing(item: GameObject) -> String {
        item.gameTime()
    }
    //LiskovSubstitution
    let whiteDice = Dice()
    let yellowMarble = Marble()
    
    @IBAction func marbleButtonPressed(_ sender: Any) {
        textField.text = "\(player1!.playerRoll())"
        //LiskovSubstitution
        print("\(rollingTheThing(item: whiteDice))")
        logRolls.log(1)
        print("Total Rolls: \(allRolls.getRolls())")
        rollsLabel.text = String(allRolls.getRolls())
    }
    

    @IBAction func diceButtonPressed(_ sender: Any) {
        textField.text = "\(player2!.playerRoll())"
        //LiskovSubstitution
        print("\(rollingTheThing(item: yellowMarble))")
        logRolls.log(1)
        print("Total Rolls: \(allRolls.getRolls())")
        rollsLabel.text = String(allRolls.getRolls())
    }
    
    @IBAction func yogaButtonPressed(_ sender: Any) {
        textField.text = ""
    }
    @IBAction func tableButtonFlipped(_ sender: Any) {
        
    }
}

