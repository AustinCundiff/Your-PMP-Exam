//
//  ResultViewController.swift
//  Your PMP Exam
//
//  Created by Austin Cundiff on 1/21/17.
//  Copyright © 2017 Austin Cundiff. All rights reserved.
//

import UIKit


class ResultViewController: UIViewController {
        var test: [Question] = []
        var score = 0.0
        var iScore = 0
        //var newList: [Question]
    @IBOutlet weak var fg: UIButton!
    
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var correctOutOfTotal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateScore()
        setScore()
        
        //newList = test
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setScore()
    {
    //var fScore = (float) score;
    //int iScore = (int) fScore;
        var grade: Float = 0.0
        let testCount: Float = 20.0
    
    correctOutOfTotal.text = String(iScore)+" out of 20"
        if(iScore != 0)
        {
            grade = (Float(iScore) / testCount) * 100
        }
        percentage.text = String(grade)+"%"
    }
        func calculateScore()
    {
    
        for q in test
        {
           print(q.document)
            if(q.userGotCorrect == true)
            {
                iScore = iScore + 1;
            }
        }
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "review")
        {
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.testList = test
            secondViewController.reviewFlag = true;
        }
        else if(segue.identifier == "quit")
        {
            
        }
        //secondViewController.testList = test
        //secondViewController.reviewFlag = true
        //secondViewController.currentQuestion = 0
    }
}
