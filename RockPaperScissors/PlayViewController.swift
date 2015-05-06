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
    
    var playerChoice: String!
    var computerChoice: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.computerChoice = randomDiceValue()
        //TODO: check for segue name
        if segue.identifier == "playGameSegue" {
            let controller = segue.destinationViewController as! ResultsViewController
            controller.playerChoice = self.playerChoice
            controller.computerChoice = self.computerChoice
        }
    }
    
    //storyboard method
    //right-click on item
    //select triggered segues
    //drag to next VC and choose Modal
    //both storyboard methods may use the same segue
    @IBAction func playAsScissors(sender: UIButton) {
        self.playerChoice = sender.titleForState(.Normal)
    }
    
    //code and storyboard method
    //right-click on VC header button
    //select triggered segues
    //drag to next VC and choose Modal
    //set Storyboard Segue Identifier in properties pane
    @IBAction func playAsPaper(sender: UIButton) {
        self.playerChoice = sender.titleForState(.Normal)
        performSegueWithIdentifier("playGameSegue", sender: self)
    }

    //code only method
    @IBAction func playAsRock(sender: UIButton) {
        self.computerChoice = randomDiceValue()
        self.playerChoice = sender.titleForState(.Normal)

        var controller: ResultsViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        controller.computerChoice = self.computerChoice
        controller.playerChoice = self.playerChoice

        self.presentViewController(controller, animated: true, completion: nil)

    }
    ////random number generator
    func randomDiceValue() -> Int {
        
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    

}

