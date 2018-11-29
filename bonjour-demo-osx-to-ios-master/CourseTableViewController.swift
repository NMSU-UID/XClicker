//
//  CourseTableViewController.swift
//  bonjour-demo-ios
//
//  Created by Elena on 11/27/18.
//  Copyright © 2018 James Zaghini. All rights reserved.
//

import UIKit

class CourseTableViewController: UITableViewController {
    
    // MARK: Properties
    var courses = [Course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleCourses()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "CourseTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CourseTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CourseTableViewCell.")
        }
        
        // Fetches the appropriate course for the data source layout.
        let course = courses[indexPath.row]
        
        cell.nameLabel.text = course.name
        cell.sectionLabel.text = course.sectionnum
        cell.professorLabel.text = course.professor
        
        return cell
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Actions
    
    @IBAction func unwindToCourseList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController, let course = sourceViewController.course {
            
            // Add a new course.
            let newIndexPath = IndexPath(row: courses.count, section: 0)
            
            courses.append(course)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    //MARK: Private Methods
    
    private func loadSampleCourses() {
        
        guard let course1 = Course(name: "BIOL 111: Introduction to Biology", sectionnum: "M01", professor: "James") else {
            fatalError("Unable to instantiate course1")
        }
        
        guard let course2 = Course(name: "COMM 265: Principles of Communication", sectionnum: "M12", professor: "Morgan") else {
            fatalError("Unable to instantiate course2")
        }
        
        courses += [course1, course2]
        
    }

}
