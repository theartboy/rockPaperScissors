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
    var computerChoice: String!
    @IBOutlet weak var gameImage: UIImageView!
    
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
        gameImage.alpha = 0
    }
    override func viewDidAppear(animated: Bool) {
        //
        UIView.animateWithDuration(0.5){
            self.gameLabel.alpha = 1
            self.gameImage.alpha = 1
        }
    }

    func computeWinner(){
        var pair = [playerChoice, computerChoice]
        var s: String!
        println(pair)
        if (playerChoice == computerChoice){
            switch playerChoice {
                case "rock":
                    s = "Tie. Rock ignores Rock"
                case "paper":
                    s = "Tie. Paper lays over Paper"
                case "scissors":
                    s = "Tie. Scissors duels Scissors"
            default:
                    s = "Something is broken"
            }
            gameImage.image = UIImage(named: "tie@2xiphone")
        }else if (playerChoice == "rock" && computerChoice == "scissors"){
            s = "Player wins. Rock crushes Scissors"
            gameImage.image = UIImage(named: "rockOverScissors@2xiphone")
        }else if (playerChoice == "rock" && computerChoice == "paper"){
            s = "Computer wins. Paper covers Rock"
            gameImage.image = UIImage(named: "paperOverRock@2xiphone")
        }else if (playerChoice == "paper" && computerChoice == "rock"){
            s = "Player wins. Paper covers Rock"
            gameImage.image = UIImage(named: "paperOverRock@2xiphone")
        }else if (playerChoice == "paper" && computerChoice == "scissors"){
            s = "Computer wins. Scissors cut Paper"
            gameImage.image = UIImage(named: "scissorsOverPaper@2xiphone")
        }else if (playerChoice == "scissors" && computerChoice == "paper"){
            s = "Player wins. Scissors cut Paper"
            gameImage.image = UIImage(named: "scissorsOverPaper@2xiphone")
        }else if (playerChoice == "scissors" && computerChoice == "rock"){
            s = "Computer wins. Rock crushes Scissors"
            gameImage.image = UIImage(named: "rockOverScissors@2xiphone")
        }
        gameLabel.text = s
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
        var controller: PlayViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("PlayViewController") as! PlayViewController

        dismissViewControllerAnimated(true, completion: nil)
        
    }
    

}
