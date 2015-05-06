//
//  PlayViewController.swift
//  RockPaperScissors
//
//  Created by John McCaffrey on 5/4/15.
//  Copyright (c) 2015 theARTboy LLC. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var playerChoice: String!
    var computerChoice: String!
    var playerScore = 0
    var computerScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        playerScore = 0
//        computerScore = 0
        scoreLabel.text = "Player: \(playerScore)   Computer: \(computerScore)"
//        println("Player: \(playerScore)   Computer: \(computerScore)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    override func viewWillAppear(animated: Bool) {
//        scoreLabel.text = "Player: \(playerScore)   Computer: \(computerScore)"
//        println("Player: \(playerScore)   Computer: \(computerScore)")
//    }
    func getPlayer(sender: UIButton) ->String{
        var s = sender.titleForState(.Normal)
        return String(s!)
    }
    func updateScoreLabel(){
//        scoreLabel.text = "Player: is   Computer: "
//        scoreLabel.text = "Player: \(self.playerScore)   Computer: \(self.computerScore)"
        
    }
    
    ///////////////////////////
    //storyboard method
    //right-click on item
    //select triggered segues
    //drag to next VC and choose Modal
    //both storyboard methods may use the same segue
    @IBAction func playAsScissors(sender: UIButton) {
//        self.playerChoice = sender.titleForState(.Normal)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//vc.userChoice = getUserShape(sender as! UIButton)        println("prepare for segue \(playerChoice)")
        if segue.identifier == "playGameSegue" {
            self.playerChoice = getPlayer(sender as! UIButton)
            self.computerChoice = randomStringValue()
            let controller = segue.destinationViewController as! ResultsViewController
            controller.playerChoice = self.playerChoice
            controller.computerChoice = self.computerChoice
            controller.playerScore = self.playerScore
            controller.computerScore = self.computerScore
        }
    }
    
    ///////////////////////////
    //code and storyboard method
    //right-click on VC header button
    //select triggered segues
    //drag to next VC and choose Modal
    //set Storyboard Segue Identifier in properties pane
    @IBAction func playAsPaper(sender: UIButton) {
        //self.playerChoice = sender.titleForState(.Normal)
        //self.playerChoice = getPlayer(sender as UIButton)
        //must change sender to sender: sender instead of sender: self to get prepareForSegue to recognize it as a button//
        performSegueWithIdentifier("playGameSegue", sender: sender)
    }

    /////////////////////////////
    //code only method
    @IBAction func playAsRock(sender: UIButton) {
        self.computerChoice = randomStringValue()
        self.playerChoice = sender.titleForState(.Normal)

        var controller: ResultsViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        controller.computerChoice = self.computerChoice
        controller.playerChoice = self.playerChoice
        controller.playerScore = self.playerScore
        controller.computerScore = self.computerScore

        self.presentViewController(controller, animated: true, completion: nil)

    }
    ///////////////////////////////
    ////random string generator
    func randomStringValue() -> String {
        // Generate a random Int32 using arc4Random
        var items = ["rock", "paper", "scissors"]
        var randomValue = Int(arc4random() % 3)
        // Return a more convenient Int, initialized with the random value
        println("rv: \(randomValue) and \(items[randomValue])")
        println("Player is: \(playerScore)   Computer is: \(computerScore)")
        return String(items[randomValue])
    }
    ////random number generator
    func randomDiceValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    

}

