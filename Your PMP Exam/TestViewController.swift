//
//  TestViewController.swift
//  Your PMP Exam
//
//  Created by Austin Cundiff on 1/18/17.
//  Copyright © 2017 Austin Cundiff. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    
   var userSelection = 0

override func viewDidLoad() {
    super.viewDidLoad()
    //@IBOutlet var questionNumberLabel: UILabel!
    //@IBOutlet var questionLabel: UILabel!
    var createdList = ["'1", "Perform Integrated Change Control", "Plan Communications", "Develop PM Plan", "Determine Budget", "Plan Cost Management", "Plan Procurements", "Plan Quality", "Plan Procurements", "Create WBS", "Define Scope", "Create WBS", "Create WBS", "Plan Quality", "Plan Scope Management", "Plan Risk Management", "Develop Schedule", "Plan Scope Management", "Plan Risk Management", "Develop Schedule", "Plan Scope Management", "Plan Stakeholder Management", "Plan Scope Management", "Define Activities", "Estimate Cost", "Estimate Activity Durations", "Define Activities", "Estimate Activity Resources", "Conduct Procurements", "1", "Estimate Cost", "Perform Integrated Change Control", "Control Quality, Manage Project Team, Control Procurements, Manage Control", "Stakeholder Engagement, Direct and Manage Project Work, Validate Scope, Control", "Schedule, Control Cost, Control Stakeholder Engagement, Monitor and Control Project", "Work, Control Scope, Plan Procurements, Perform Quality Assurance, Control", "Communications, Conduct Procurements", "1", "1", "Control Cost", "Control Scope", "Manage Stakeholder Engagement", "Define Activities", "1", "Plan Procurements", "Plan Procurements", "Develop Schedule", "Sequence Activities", "1", "1", "Develop PM Plan", "Close Project or Phase", "Control Quality", "Control Quality", "Direct and Manage Project Work", "Validate Scope", "Control Schedule", "Control Stakeholder Engagement", "Acquire Project Team", "Manage Communications", "Plan Procurements", "Perform Integrated Change Control", "Conduct Procurements", "Close Project or Phase", "Validate Scope", "1", "Acquire Project Team", "Plan Procurements", "1", "Plan Quality", "1", "Collect Requirements", "Collect Requirements", "Estimate Activity Resources", "Plan Human Resource Management", "Acquire Project Team, Conduct Procurements", "Identify Risk", "1", "Develop Schedule", "Plan Procurements", "Plan Stakeholder Management", "1", "1", "Control Procurements", "Direct and Manage Project Work", "Validate Scope, Control Scope, Control Schedule, Control Cost, Control Quality, Control Communication, Control Risk, Control Procurements, Control Stakeholder Engagement", "Monitor and Control Project Work"]
    var documentList = ["Project Management Plan", "Change Managent Plan", "Communication Management Plan", "Configuration Management Plan", "Cost Baseline", "Cost Management Plan", "HR Management Plan", "Process Improvement Plan", "Procurements Management Plan", "Scope Baseline", "Project Scope Statement", "WBS", "WBS Dictionary", "Quality Management Plan", "Requirements Management Plan", "Risk Management Plan", "Schedule Baseline", "Scope Management Plan", "Stakeholder Management Plan", "Schedule Management Plan", "Activity Attributes", "Activity Cost Estimates", "Activity Duration Estimates", "Activity List", "Activity Resource Requirements", "Agreements", "Assumption Log", "Basis of Estimates", "Change Log", "Change Requests", "Corrective Action Plans", "Forecasts", "Cost Forecasts", "Schedule Forecasts", "Issue Log", "Milestone List", "Process Documentation", "Procurements Documents", "Procurements Statement of Work", "Project Calendars", "Project Charter", "Project Funding Requirements", "Project Schedule", "Project Schedule Network Diagrams", "Enterprise Environmental Factors", "Organizational Process Assets", "PM Plan", "Final Product Service or Result", "Validated Changes", "Verified Deliverables", "Deliverables", "Accepted Deliverables", "Schedule Forecasts", "Closed Procurements", "Project Staff Assignments", "Project Communications", "Make or Buy Decisions", "Approved Change Requests", "Selected Sellers", "Lessons Learned Documents", "Customer Sign Off", "Completed Checklists", "Project Staff Assignments", "Project Statement of Work", "Quality Audit Reports", "Quality Checklists", "Quality Control Measurements", "Quality Metrics", "Quality Standards", "Requirements Documentation", "Requirements Traceability Matrix", "Resource Breakdown Structure", "Responsibility Assignment Matrix", "Resource Calendars", "Risk Register", "Role Descriptions", "Schedule Data", "Source Selection Criteria", "Stakeholder Register", "Training Plans", "Technical Documents", "Team Performance Assessments", "Work Performance Data", "Work Performance Information", "Work Performance Reports"]
    
    
    
    // Do any additional setup after loading the view.
}
//88EC74 green 30% opacity
//FEB4B3    pink
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


    @IBAction func prev(_ sender: Any) {
    }
    @IBAction func nextPress(_ sender: Any) {
    }

        
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
}
