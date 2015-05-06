//
//  ResultsViewController.swift
//  RockPaperScissors
//
//  Created by John McCaffrey on 5/4/15.
//  Copyright (c) 2015 theARTboy LLC. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var playerChoice: String!
    var playerChoiceNum: Int!
    var computerChoice: String!
    @IBOutlet weak var gameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        println("p: \(self.playerChoice)  c: \(self.computerChoice) ")
        computeWinner()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        //
        gameLabel.alpha = 0
    }
    override func viewDidAppear(animated: Bool) {
        //
        UIView.animateWithDuration(0.5){
            self.gameLabel.alpha = 1
        }
    }
    func computeWinner(){
//        switch playerChoice {
//            case "rock":
//                playerChoiceNum = 1
//            case "paper":
//                playerChoiceNum = 2
//            case "scissors":
//                playerChoiceNum = 3
//            default:
//                playerChoiceNum = 0
//        }
//        println("c: \(self.computerChoice) p: \(self.playerChoiceNum)")

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction private func playAgain() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
