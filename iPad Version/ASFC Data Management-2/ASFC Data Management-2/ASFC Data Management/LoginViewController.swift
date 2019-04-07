//
//  FirstViewController.swift
//  ASFC Data Management
//
//  Created by Micah Connor on 10/11/17.
//  Copyright © 2017 Eklektik Design. All rights reserved.
//


//************************************************* Imports *******************************************************************//
import UIKit


//************************************************* UserPass Struct ***********************************************************//
struct UserPass
{
    let Username: String
    let Password: String
    let Admin: Bool

    var description: String     // Returns the print out of a User/Password object
    {
        return "\(Username),\(Password),\(Admin.description)"
    }
}


//************************************************* LoginViewController Class *************************************************//
class FirstViewController: UIViewController
{
    
//************************************************* Control Handlers **********************************************************//
    @IBOutlet weak var UsernameLabelVal: UITextField!
    @IBOutlet weak var PasswordLabelVal: UITextField!
    @IBOutlet weak var LoginButtonText: UIButton!
    @IBOutlet weak var LoginLabelText: UILabel!

    
//************************************************* Local Variables ***********************************************************//
    var Login = true
    

//************************************************* Page Load Functions *******************************************************//
    override func viewDidLoad()
    {
        super.viewDidLoad()
        disablepages()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//************************************************* Control Actions ***********************************************************//
    @IBAction func LoginButtonAct(_ sender: UIButton)     // Checks if the username/password combination is valid and enables the respective pages | Logs the user out
    {
        if (Login == true)
        {
            let UserPasses = parseUsers()
            let CurrentEntry = UserPass(Username: UsernameLabelVal.text!, Password: PasswordLabelVal.text!, Admin: false)
            
            if UserPasses.contains(where: { $0.Username == CurrentEntry.Username && $0.Password == CurrentEntry.Password })
            {
                enablepages()
                LoggedInUser.update(Name: CurrentEntry.Username)
                LoginButtonText.setTitle("Logout", for: .normal)
                LoginLabelText.text = LoggedInUser.name
                UsernameLabelVal.text = ""
                PasswordLabelVal.text = ""
                UsernameLabelVal.isEnabled = false
                PasswordLabelVal.isEnabled = false
                Login = false
            }
            else
            {
                Popup(Message: "Invalid username or password")
            }
            if UserPasses.contains(where: { $0.Username == CurrentEntry.Username && $0.Password == CurrentEntry.Password && $0.Admin })
            {
                enableAdminpages()
            }
            
        }
        else
        {
            disablepages()
            LoggedInUser.update(Name: "None")
            LoginButtonText.setTitle("Login", for: .normal)
            LoginLabelText.text = "Welcome"
            UsernameLabelVal.isEnabled = true
            PasswordLabelVal.isEnabled = true
            UsernameLabelVal.text = ""
            PasswordLabelVal.text = ""
            Login = true
        }
    }
    
    @IBAction func UsernameLabelSelected(_ sender: UITextField)     // Clears the username label when it is selected
    {
        UsernameLabelVal.text = ""
    }
    
    @IBAction func PasswordLabelSelected(_ sender: UITextField)     // Clears the password label when it is selected
    {
        PasswordLabelVal.text = ""
    }

    
//************************************************* Functions *****************************************************************//
    func enablepages()     // Enables the basic user pages
    {
        let tabBarControllerItems = self.tabBarController?.tabBar.items
        
        if let tabArray = tabBarControllerItems
        {

            let tabBarItem1 = tabArray[1]
            let tabBarItem2 = tabArray[2]
            let tabBarItem3 = tabArray[3]

            tabBarItem1.isEnabled = true
            tabBarItem2.isEnabled = true
            tabBarItem3.isEnabled = true
        }
    }

    func enableAdminpages()     // Enables the administrator pages
    {
        let tabBarControllerItems = self.tabBarController?.tabBar.items

        if let tabArray = tabBarControllerItems
        {
            let tabBarItem4 = tabArray[4]
            let tabBarItem5 = tabArray[5]

            tabBarItem4.isEnabled = true
            tabBarItem5.isEnabled = true
        }
    }

    func disablepages()     // Disables all pages
    {
        let tabBarControllerItems = self.tabBarController?.tabBar.items

        if let tabArray = tabBarControllerItems
        {
            let tabBarItem1 = tabArray[1]
            let tabBarItem2 = tabArray[2]
            let tabBarItem3 = tabArray[3]
            let tabBarItem4 = tabArray[4]
            let tabBarItem5 = tabArray[5]

            tabBarItem1.isEnabled = false
            tabBarItem2.isEnabled = false
            tabBarItem3.isEnabled = false
            tabBarItem4.isEnabled = false
            tabBarItem5.isEnabled = false
        }
    }

    func parseUsers() -> [UserPass]     // Reads the Users.csv file and returns the contents as a list of usable objects
    {
        //IO().clearFile(fileName: "Users.csv")     // Uncomment to rest all files
        var StrUserDB = IO().readfromfile(fileName: "Users.csv")
        if (StrUserDB == "")
        {
            IO().createStartFiles()
            StrUserDB = IO().readfromfile(fileName: "Users.csv")
        }
        var UserDBLines = StrUserDB.components(separatedBy: "\n")
        UserDBLines.removeFirst()
        var UserPasses: [UserPass] = []
        for line in UserDBLines
        {
            var linedetails = line.components(separatedBy: ",")
            UserPasses.append(UserPass(Username: linedetails[0], Password: linedetails[1], Admin: Bool(linedetails[2])!))
        }
        return UserPasses
    }

    func Popup(Message: String)     // Displays a popup window with a given message
    {
        let alertController = UIAlertController(title: "Warning", message: Message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        {
            (result: UIAlertAction) -> Void in
            print("OK")
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

