//
//  ResultsViewController.swift
//  RockPaperScissors
//
//  Created by John McCaffrey on 5/4/15.
//  Copyright (c) 2015 theARTboy LLC. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var playerChoice: Int!
    var computerChoice: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.computerChoice = 
        println("c: \(self.computerChoice) p: \(self.playerChoice)")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
