//
//  SecondViewController.swift
//  Your PMP Exam
//
//  Created by Austin Cundiff on 1/19/17.
//  Copyright © 2017 Austin Cundiff. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var qText: UITextView!
    @IBOutlet weak var test: UILabel!
    
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var fg: UIButton!
    
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var aText: UILabel!
    @IBOutlet weak var bText: UILabel!
    @IBOutlet weak var cText: UILabel!
    @IBOutlet weak var dText: UILabel!
    var reviewFlag = false
    var questionList: [Question] = []
    var testList: [Question] = []
    var userSelection = 0
    var currentQuestion = 0
    let questionString = "Please select the choice that represents where the document: "
    let createdEndString = " was created"
    var createdList = ["1", "Perform Integrated Change Control", "Plan Communications", "Develop PM Plan", "Determine Budget", "Plan Cost Management", "Plan Procurements", "Plan Quality", "Plan Procurements", "Create WBS", "Define Scope", "Create WBS", "Create WBS", "Plan Quality", "Plan Scope Management", "Plan Risk Management", "Develop Schedule", "Plan Scope Management", "Plan Stakeholder Management", "Plan Scope Management", "Define Activities", "Estimate Cost", "Estimate Activity Durations", "Define Activities", "Estimate Activity Resources", "Conduct Procurements", "1", "Estimate Cost", "Perform Integrated Change Control", "Control Quality, Manage Project Team, Control Procurements, Manage Control Stakeholder Engagement, Direct and Manage Project Work, Validate Scope, Control Schedule, Control Cost, Control Stakeholder Engagement, Monitor and Control Project Work, Control Scope, Plan Procurements, Perform Quality Assurance, Control Communications, Conduct Procurements","1", "1", "Control Cost", "Control Scope", "Manage Stakeholder Engagement", "Define Activities", "1", "Plan Procurements", "Plan Procurements", "Develop Schedule", "Develop Project Charter", "Determine Budget", "Develop Schedule", "Sequence Activities", "1", "1", "Develop PM Plan", "Close Project or Phase", "Control Quality", "Control Quality", "Direct and Manage Project Work", "Validate Scope", "Control Schedule", "Control Stakeholder Engagement", "Acquire Project Team", "Manage Communications", "Plan Procurements", "Perform Integrated Change Control", "Conduct Procurements", "Close Project or Phase", "Validate Scope", "1", "Acquire Project Team", "Plan Procurements", "1","Plan Quality", "Control Quality", "Plan Quality", "1", "Collect Requirements", "Collect Requirements", "Estimate Activity Resources", "Plan Human Resource Management", "Acquire Project Team, Conduct Procurements", "Identify Risk", "1", "Develop Schedule", "1", "Plan Procurements", "Plan Stakeholder Management", "1", "1", "Control Procurements", "Direct and Manage Project Work", "Validate Scope, Control Scope, Control Schedule, Control Cost, Control Quality, Control Communication, Control Risk, Control Procurements, Control Stakeholder Engagement", "Monitor and Control Project Work"]
    var documentList = ["Project Management Plan", "Change Managent Plan", "Communication Management Plan", "Configuration Management Plan", "Cost Baseline", "Cost Management Plan", "HR Management Plan", "Process Improvement Plan", "Procurements Management Plan", "Scope Baseline", "Project Scope Statement", "WBS", "WBS Dictionary", "Quality Management Plan", "Requirements Management Plan", "Risk Management Plan", "Schedule Baseline", "Scope Management Plan", "Stakeholder Management Plan", "Schedule Management Plan", "Activity Attributes", "Activity Cost Estimates", "Activity Duration Estimates", "Activity List", "Activity Resource Requirements", "Agreements", "Assumption Log", "Basis of Estimates", "Change Log", "Change Requests", "Corrective Action Plans", "Forecasts", "Cost Forecasts", "Schedule Forecasts", "Issue Log", "Milestone List", "Process Documentation", "Procurements Documents", "Procurements Statement of Work", "Project Calendars", "Project Charter", "Project Funding Requirements", "Project Schedule", "Project Schedule Network Diagrams", "Enterprise Environmental Factors", "Organizational Process Assets", "PM Plan", "Final Product Service or Result", "Validated Changes", "Verified Deliverables", "Deliverables", "Accepted Deliverables", "Schedule Forecasts", "Closed Procurements", "Project Staff Assignments", "Project Communications", "Make or Buy Decisions", "Approved Change Requests", "Selected Sellers", "Lessons Learned Documents", "Customer Sign Off", "Completed Checklists", "Project Staff Assignments", "Project Statement of Work", "Quality Audit Reports", "Quality Checklists", "Quality Control Measurements", "Quality Metrics", "Quality Standards", "Requirements Documentation", "Requirements Traceability Matrix", "Resource Breakdown Structure", "Responsibility Assignment Matrix", "Resource Calendars", "Risk Register", "Role Descriptions", "Schedule Data","Seller Proposals", "Source Selection Criteria", "Stakeholder Register", "Training Plans", "Technical Documentation", "Team Performance Assessments", "Work Performance Data", "Work Performance Information", "Work Performance Reports"]
    var updatedList = ["1","1","1","1","1", "1","1", "1", "1","1", "1", "Plan Quality Management", "Plan Quality Management", "1",
        "1", "1", "1","1","1", "1", "Sequence Activities","Determine Budget", "1", "Sequence Activities","Develop Schedule", "Control Quality", "Direct and Manage Project Work", "Estimate Activity Durations","Control Quality", "Plan Risk Responses", "Control Quality", "Control Communication", "Monitor and Control Project Work", "Monitor and Control Project Work", "Direct and Manage Project Work", "Sequence Activities", "Perform Quality Assurance", "Control Procurements", "1", "Develop Schedule", "Develop Project Charter", "Conduct Procurements", "Control Schedule", "1",
        "Develop Project Team", "Develop PM Plan", "Direct and Manage Project Work", "1", "1", "1", "1", "1", "Monitor and Control Project Work", "1", "1", "1","1", "1", "1","1", "1", "Control Quality", "Manage Project Team", "1", "Perform Quality Assurance", "1", "1", "1", "Control Quality", "Direct and Manage Project Work", "Define Scope", "1", "Plan Quality Management", "Estimate Activity Resources", "Direct and Manage Project Work", "Manage Project Team", "Develop Schedule", "1", "1", "Direct and Manage Project Work", "Perform Quality Assurance", "Plan Risk Responses", "1", "1", "1", "Monitor and Control Project Work"]
        
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "submit")
        {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.test = testList
        }
        
    }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initialize the questions
        if documentList.endIndex == createdList.endIndex {
            for i in 0...documentList.endIndex-1
            {
                let q: Question = Question()
                q.document = documentList[i]
                q.created = createdList[i]
                q.updated = updatedList[i]
                
                questionList.append(q)
            }
        }
        if(!reviewFlag)
        {
            generateTest()
        }
        if(reviewFlag)
        {
            currentQuestion = 0
            print("Review:")
            print(testList[0].document)
            print(testList[1].document)
            print(currentQuestion)
        }
        updateQuestion(q: testList[currentQuestion])
        aButton.layer.cornerRadius = 5
        aButton.layer.borderWidth = 1
        bButton.layer.cornerRadius = 5
        bButton.layer.borderWidth = 1
        cButton.layer.cornerRadius = 5
        cButton.layer.borderWidth = 1
        dButton.layer.cornerRadius = 5
        dButton.layer.borderWidth = 1
        //qText.text = questionString + testList[currentQuestion].document + createdEndString
      
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func next(_ sender: UIButton) {
        if(reviewFlag)
        {
            print("Right Choice :" + String(testList[currentQuestion].correctChoice))
            print("User Choice :" + String(testList[currentQuestion].userChoice))

            
            if(currentQuestion < 20)
            {
                currentQuestion = currentQuestion + 1;
            }
            if(currentQuestion <= 19)
            {
                updateQuestion(q: testList[currentQuestion]);
            }
            if(currentQuestion >= 20)
            {
                print("Submitting");
                submit();
            }
        }
        
        if(!reviewFlag)
        {
            
            print("Not Review");
            if(userSelection == 0)
            {
                print("Pick an answer");
            }
            switch testList[currentQuestion].correctChoice
            {
            case 0: print("Pick an answer");
                
            case 1:
                if(userSelection == 1)
                {
                    testList[currentQuestion].userGotCorrect = true
                }
                else{testList[currentQuestion].userGotCorrect = false}

                break;
            case 2:
                if(userSelection == 2)
                {
                    testList[currentQuestion].userGotCorrect = true
                }
                else{testList[currentQuestion].userGotCorrect = false}
                break;
            case 3:
                if(userSelection == 3)
                {
                    testList[currentQuestion].userGotCorrect = true
                }
                else{testList[currentQuestion].userGotCorrect = false}
                break;
                
            case 4:
                if(userSelection == 4)
                {
                    testList[currentQuestion].userGotCorrect = true
                }
                else{testList[currentQuestion].userGotCorrect = false}
                
            default:
                testList[currentQuestion].userGotCorrect = false
            }
            /*if(userSelection == 1 && !testList[currentQuestion].userGotCorrect)
            {
                testList[currentQuestion].userChoice = 1
            }
            else if(userSelection == 2 && !testList[currentQuestion].userGotCorrect)
            {
                testList[currentQuestion].userChoice = 2
            }
            else if(userSelection == 3 && !testList[currentQuestion].userGotCorrect)
            {
                testList[currentQuestion].userChoice = 3
                
            }
            else if(userSelection == 3 && !testList[currentQuestion].userGotCorrect)
            {
                testList[currentQuestion].userChoice = 4
            }*/
            
            testList[currentQuestion].userChoice = userSelection
            print("User picked" + String(userSelection))
            print("Storing: " + String(testList[currentQuestion].userChoice))
            if(currentQuestion < 20)
            {
                currentQuestion = currentQuestion + 1;
            }
            if(currentQuestion <= 19)
            {
                updateQuestion(q: testList[currentQuestion]);
            }
            
            if(currentQuestion >= 20)
            {
                print("Submitting");
                submit();
            }

        }
}
    @IBAction func previous(_ sender: UIButton) {
        if(currentQuestion > 0)
        {
            currentQuestion = currentQuestion - 1;
        }
        if(currentQuestion >= 0)
        {
            updateQuestion(q: testList[currentQuestion]);
        }
        
    }
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func aPress(_ sender: UIButton) {
        aButton.backgroundColor = UIColor(netHex:0xE0E0E0)
        bButton.backgroundColor = UIColor.white
        cButton.backgroundColor = UIColor.white
        dButton.backgroundColor = UIColor.white
        userSelection = 1
    }
    @IBAction func bPress(_ sender: UIButton) {
        bButton.backgroundColor = UIColor(netHex:0xE0E0E0)
        aButton.backgroundColor = UIColor.white
        cButton.backgroundColor = UIColor.white
        dButton.backgroundColor = UIColor.white
        userSelection = 2
    }
    @IBAction func cPress(_ sender: UIButton) {
        cButton.backgroundColor = UIColor(netHex:0xE0E0E0)
        bButton.backgroundColor = UIColor.white
        aButton.backgroundColor = UIColor.white
        dButton.backgroundColor = UIColor.white
        userSelection = 3
    }
    @IBAction func dPress(_ sender: UIButton) {
        dButton.backgroundColor = UIColor(netHex:0xE0E0E0)
        bButton.backgroundColor = UIColor.white
        cButton.backgroundColor = UIColor.white
        aButton.backgroundColor = UIColor.white
        userSelection = 4
    }
    /*class Question
    {
        var userChoice = 0
        var created = ""
        var updated = ""
        var document = ""
        var correctChoice = 0
        var userGotCorrect = false
        var isCreated = true
        var wrongAnswers = [String]()
        
    }*/
    func generateDistractors(choice: Int, correctAnswer: String) -> [String]
    {
        
        /*
         * Here we will generate the distractors on a question-by-question basis.
         * */
        var result = [String]()
      
        var distractorList = ["Control Quality", "Manage Project Team", "Control Procurements", "Manage Control Stakeholder Engagement", "Direct and Manage Project Work", "Validate Scope", "Control Schedule", "Control Cost", "Control Stakeholder Engagement", "Monitor and Control Project Work", "Control Scope", "Plan Procurements", "Perform Quality Assurance", "Control Communications", "Conduct Procurements","Develop PM Plan", "Close Project or Phase", "Control Quality", "Direct and Manage Project Work", " Acquire Project Team", "Manage Communications", "Plan Procurements", "Perform Integrated Change Control", "Conduct Procurements", "Close Project or Phase", "Control Risk", "Plan Communications", "Determine Budget", "Plan Cost Management", "Plan Quality", "Create WBS", "Define Scope", "Plan Quality", "Plan Scope Management", "Plan Risk Management", "Estimate Activity Resources", "Define Activities", "Estimate Activity Durations", "Estimate Cost"]
        var distractorSize = 0;
        distractorSize = distractorList.count - 1;
        var distractorArray: [Int] = []
        var justIncase = 0;
        var distractorsAreNotUnique = false;
        /*
         We don't want a distractor accidentally being the same as the correct question. Therefore, we will generate a new list if there is a
         duplicate. I use a counter to keep track of how many times we've had a conflict, therefore preventing an infinite loop. After, we set
         the other choices to the distractors we've generated to make things tricky for the test-taker.
         */
        repeat
        {
            distractorArray = getRandomDistractors(num: distractorSize);
            for i in 0..<distractorArray.count
            {
                if(distractorList[distractorArray[i]] == correctAnswer)
                {
                    distractorsAreNotUnique = true;
                }
            }
            
            justIncase = justIncase + 1
            if(justIncase >= 101)
            {
                break;
            }
            
        }while(distractorsAreNotUnique);
        
        for ii in 0..<3
        {
            result.append((distractorList[distractorArray[ii]]))
        }
        
        return result
    }
    //build a pool of wrong answers from the list of distractors. Ensure that each answer is unique.
    func getRandomDistractors(num: Int) -> [Int]
    {
        var result: [Int] = [0,0,0]
        var k = 0
        var j = 0
        
        result[0] = Int(arc4random_uniform(UInt32(num)) + 1)
        
        repeat
        {
            k = Int(arc4random_uniform(UInt32(num)) + 1)
            if(k != result[0])
            {
                break;
            }
        } while(true);
        result[1] = k;
        repeat
        {
            j = Int(arc4random_uniform(UInt32(num)) + 1)
            
            if(j != result[0] && j != result[1])
            {
                break;
            }
        } while(true);
        
        result[2] = j;
        
        return result;
    }
    
   // public void next(View v)
    func nextTest()
    {
      
    if(!reviewFlag)
    {
            print("Not Review");
            switch testList[currentQuestion].correctChoice
            {
                case 0: print("Pick an answer");
        
            case 1: if(userSelection == 1)
            {
                testList[currentQuestion].userGotCorrect = true
            }
    
            case 2: if(userSelection == 2)
            {
                testList[currentQuestion].userGotCorrect = true
            }
    
            case 3: if(userSelection == 3)
            {
                testList[currentQuestion].userGotCorrect = true
            }
   
            case 4: if(userSelection == 4)
            {
                testList[currentQuestion].userGotCorrect = true
            }
    
            default:
                if(userSelection == 0)
                {
                    testList[currentQuestion].userGotCorrect = false
                }
            }
    }
        
    if(userSelection == 1 && !testList[currentQuestion].userGotCorrect)
    {
        testList[currentQuestion].userChoice = 1
    }
    else if(userSelection == 2 && !testList[currentQuestion].userGotCorrect)
    {
        testList[currentQuestion].userChoice = 2
    }
    else if(userSelection == 3 && !testList[currentQuestion].userGotCorrect)
    {
        testList[currentQuestion].userChoice = 3

    }
    else if(userSelection == 3 && !testList[currentQuestion].userGotCorrect)
    {
        testList[currentQuestion].userChoice = 4
    }
    
    if(currentQuestion < 20)
    {
    currentQuestion = currentQuestion + 1;
    }
    if(currentQuestion <= 19)
    {
      updateQuestion(q: testList[currentQuestion]);
    }
    
    if(currentQuestion >= 20)
    {
    submit();
    }
    }
    
    func submit()
    {
        performSegue(withIdentifier: "submit", sender: nil)
    }
    
    func updateQuestion(q: Question)
    {
        let questionNumber = (currentQuestion + 1);
        let questionCreate = " was created."
        test.text = "Question #" + String(questionNumber)
        qText.text = questionString + q.document //qText.setText(questionTextBeginning);
        //qText.(q.getDocument());
        let temp = reviewFlag;
        //clearAnswers();
        /*
         Added this check to ensure our previous test generator function didn't miss an empty created or updated entry.
         */
        if(q.getCreated().contains("1"))
        {
            q.isCreated = false;
        }
        if(q.getUpdated().contains("1"))
        {
            q.isCreated = true;
        }
        if(q.isCreated == true)
        {
           
            qText.text.append(questionCreate)
        
        switch(q.correctChoice)
            {
            case 1: aText.text = q.getCreated()
                break;
            case 2: bText.text = q.getCreated()
                break;
            case 3: cText.text = q.getCreated()
                break;
            case 4: dText.text = q.getCreated()
                break;
            default: cText.text = q.getCreated()
                break;
            }
            if(temp)
            {
                 print("Setting Button Color");
                if(q.correctChoice == 2)
                {
                   bButton.backgroundColor = UIColor.green
                }
                else if(q.correctChoice == 1)
                {
                    aButton.backgroundColor = UIColor.green
                }
                else if(q.correctChoice == 3)
                {
                    cButton.backgroundColor = UIColor.green
                }
                else if(q.correctChoice == 4)
                {
                    dButton.backgroundColor = UIColor.green
                }
            }
            
            //var distractors = ["", "",""]
            var distractors = q.wrongAnswers;
            if(q.correctChoice == 1)
            {
                if(reviewFlag)
                {
                    bButton.backgroundColor = UIColor.white
                    cButton.backgroundColor = UIColor.white
                    dButton.backgroundColor = UIColor.white
                }
                cText.text = distractors[0]
                bText.text = distractors[1]
                dText.text = distractors[2]
            }
            else if(q.correctChoice == 2)
            {
                if(reviewFlag)
                {
                    aButton.backgroundColor = UIColor.white
                    cButton.backgroundColor = UIColor.white
                    dButton.backgroundColor = UIColor.white
                }
                cText.text = distractors[0]
                aText.text = distractors[1]
                dText.text = distractors[2]
            }
            else if(q.correctChoice == 3)
            {
                if(reviewFlag)
                {
                    dButton.backgroundColor = UIColor.white
                    bButton.backgroundColor = UIColor.white
                    aButton.backgroundColor = UIColor.white
                }
                dText.text = distractors[0]
                bText.text = distractors[1]
                aText.text = distractors[2]
            }
            else if(q.correctChoice == 4)
            {
                if(reviewFlag)
                {
                    bButton.backgroundColor = UIColor.white
                    aButton.backgroundColor = UIColor.white
                    cButton.backgroundColor = UIColor.white
                }
                bText.text = distractors[0]
                aText.text = distractors[1]
                cText.text = distractors[2]
            }
            if(!q.userGotCorrect && reviewFlag)
            {
                switch q.userChoice
                {
                case 0: break;
                case 1: aButton.backgroundColor = UIColor.red
                break;
                case 2: bButton.backgroundColor = UIColor.red
                break;
                case 3: cButton.backgroundColor = UIColor.red
                break;
                case 4: dButton.backgroundColor = UIColor.red
                break;
                default: break;
                }
            }
            if(reviewFlag && currentQuestion >= 20)
            {
                nextButton.setTitle("Finish", for: .normal)
            }
            if(currentQuestion >= 20 && !reviewFlag)
            {
                nextButton.setTitle("Submit", for: .normal)
            }
            
        }
        let questionUpdate = " was updated."
        if(q.isCreated == false)
        {
            qText.text.append(questionUpdate)
            
            switch(q.correctChoice)
            {
            case 1: aText.text = q.getUpdated()
            break;
            case 2: bText.text = q.getUpdated()
            break;
            case 3: cText.text = q.getUpdated()
            break;
            case 4: dText.text = q.getUpdated()
            break;
            default: cText.text = q.getUpdated()
            break;
            }
            if(temp)
            {
                //  System.out.println("Its true");
                if(q.correctChoice == 2)
                {
                    bButton.backgroundColor = UIColor.green
                }
                else if(q.correctChoice == 1)
                {
                    aButton.backgroundColor = UIColor.green
                }
                else if(q.correctChoice == 3)
                {
                    cButton.backgroundColor = UIColor.green
                }
                else if(q.correctChoice == 4)
                {
                    dButton.backgroundColor = UIColor.green
                }
            }
            
            //var distractors = ["", "",""]
            var distractors = q.wrongAnswers;
            if(q.correctChoice == 1)
            {
                if(reviewFlag)
                {
                    bButton.backgroundColor = UIColor.white
                    cButton.backgroundColor = UIColor.white
                    dButton.backgroundColor = UIColor.white
                }
                cText.text = distractors[0]
                bText.text = distractors[1]
                dText.text = distractors[2]
            }
            else if(q.correctChoice == 2)
            {
                if(reviewFlag)
                {
                    aButton.backgroundColor = UIColor.white
                    cButton.backgroundColor = UIColor.white
                    dButton.backgroundColor = UIColor.white
                }
                cText.text = distractors[0]
                aText.text = distractors[1]
                dText.text = distractors[2]
            }
            else if(q.correctChoice == 3)
            {
                if(reviewFlag)
                {
                    dButton.backgroundColor = UIColor.white
                    bButton.backgroundColor = UIColor.white
                    aButton.backgroundColor = UIColor.white
                }
                dText.text = distractors[0]
                bText.text = distractors[1]
                aText.text = distractors[2]
            }
            else
            {
                if(reviewFlag)
                {
                    bButton.backgroundColor = UIColor.white
                    aButton.backgroundColor = UIColor.white
                    cButton.backgroundColor = UIColor.white
                }
                bText.text = distractors[0]
                aText.text = distractors[1]
                cText.text = distractors[2]
            }
            if(!q.userGotCorrect && reviewFlag)
            {
                switch q.userChoice
                {
                case 0: break;
                case 1: aButton.backgroundColor = UIColor.red
                break;
                case 2: bButton.backgroundColor = UIColor.red
                break;
                case 3: cButton.backgroundColor = UIColor.red
                break;
                case 4: dButton.backgroundColor = UIColor.red
                break;
                default: break;
                }
            }
            if(reviewFlag && currentQuestion >= 20)
            {
                nextButton.setTitle("Finish", for: .normal)
            }
            if(!reviewFlag && currentQuestion >= 20)
            {
                nextButton.setTitle("Submit", for: .normal)
            }
            
            
        }
        //set right answer then set wrong answers
    }

func generateChoice() -> Int
{
    return Int(arc4random_uniform(UInt32(4)) + 1)
}

func generateTest()
{
    //test = new ArrayList<Question>();
    let size = questionList.count - 1;
    var choice = 0;
    
    for _ in 0...19
    {
    
    let k = Int(arc4random_uniform(UInt32(size - 1)) + 1)
    var q = Question()
    q = questionList[k]
    
    if(q.getUpdated().contains("1") && !q.getCreated().contains("1"))
    {
    choice = generateChoice();
    q.correctChoice = choice
    q.wrongAnswers = generateDistractors(choice: q.correctChoice, correctAnswer: q.getCreated())
    
    testList.append(q)
    }
    else if(q.getCreated().contains("1") && !q.getUpdated().contains("1"))
    {
   
    choice = generateChoice();
    q.correctChoice = choice
    q.wrongAnswers = generateDistractors(choice: q.correctChoice, correctAnswer: q.getUpdated());
    
        testList.append(q);
    }
    else if(q.getCreated().contains("1") && q.getUpdated().contains("1"))
    {
    
    choice = generateChoice()
    q.correctChoice = choice
    q.wrongAnswers = generateDistractors(choice: q.correctChoice, correctAnswer: q.getUpdated())
    testList.append(q);
    }
    else
    {
    let fiftyFifty = Int(arc4random_uniform(UInt32(2)) + 1)

    if(fiftyFifty == 1)
    {
    choice = generateChoice();
    q.correctChoice = choice
    q.wrongAnswers = generateDistractors(choice: q.correctChoice, correctAnswer: q.getCreated());
    q.isCreated = true
    
    testList.append(q);
    }
    else if(fiftyFifty == 2)
    {
        choice = generateChoice();
        q.correctChoice = choice
        q.wrongAnswers = generateDistractors(choice: q.correctChoice, correctAnswer: q.getUpdated());
        q.isCreated = false
        
        testList.append(q);
    }
    else
    {
        choice = generateChoice();
        q.correctChoice = choice
        q.wrongAnswers = generateDistractors(choice: q.correctChoice, correctAnswer: q.getCreated());
        q.isCreated = true
        
        testList.append(q);
    }
   }
  }
    
 }


}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
