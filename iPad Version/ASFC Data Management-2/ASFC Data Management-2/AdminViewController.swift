//
//  AdminViewController.swift
//  ASFC Data Management
//
//  Created by Micah Connor on 10/27/17.
//  Copyright © 2017 Eklektik Design. All rights reserved.
//


//************************************************* Imports *******************************************************************//
import UIKit
import MessageUI


//************************************************* AdminViewController Class *************************************************//
class AdminViewController: UIViewController, MFMailComposeViewControllerDelegate
{
    
    
//************************************************* Control Handlers **********************************************************//
    @IBOutlet weak var PrefEmailLabelVal: UITextField!
    @IBOutlet weak var NameLabelVal: UITextField!
    @IBOutlet weak var PasswordLabelVal: UITextField!
    @IBOutlet weak var Password2LabelVal: UITextField!
    @IBOutlet weak var AdminToggleVal: UISwitch!
    @IBOutlet weak var WorkerPickerVal: UIPickerView!
    
    
//************************************************* Local Variables ***********************************************************//
    let localfile = "Users.csv"
    var UserCollection: [UserPass] = []
    var selectedItem: String?

    
//************************************************* Page Load Functions *******************************************************//
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UserCollection = FirstViewController().parseUsers()
        createUsrPicker()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//************************************************* Control Actions ***********************************************************//
    @IBAction func AddButtonAct(_ sender: UIButton)     // Adds a new user when the button is pressed
    {
        if((NameLabelVal.text?.description.contains(","))! || (PasswordLabelVal.text?.description.contains(","))!)
        {
            Popup(Message: "Please Remove Commas (,) ")
        }
        else
        {
            if(PasswordLabelVal.text?.description == Password2LabelVal.text?.description && PasswordLabelVal.text?.description != "")
            {
                let NewItem: UserPass = UserPass(Username: (NameLabelVal.text?.description)!, Password: (PasswordLabelVal.text?.description)!, Admin: AdminToggleVal.isOn)
                
                UserCollection.append(NewItem)
                _ = IO().writetofile(text: NewItem.description, fileName: localfile)
                WorkerPickerVal.dataSource = self
                NameLabelVal.text = ""
                PasswordLabelVal.text = ""
                Password2LabelVal.text = ""
                AdminToggleVal.isOn = false
            }
            else
            {
                Popup(Message: "Invalid Username or Password")
            }
        }
    }

    @IBAction func RemoveButtonAct(_ sender: UIButton)     // Removes a selected user when the button is pressed
    {
        var cont = true
        if (UserCollection[WorkerPickerVal.selectedRow(inComponent: 0)].Admin)
        {
            if (CountAdmin() - 1 <= 0)
            {
                cont = false
            }
        }
        if (cont)
            {
            UserCollection.remove(at: WorkerPickerVal.selectedRow(inComponent: 0))
            _ = IO().clearFile(fileName: localfile)
            for i in UserCollection {
                _ = IO().writetofile(text: i.description, fileName: localfile)
            }
        }
            else
        {
            Popup(Message: "There must always be at least one admin account")
        }
        WorkerPickerVal.dataSource = self
    }
    
    @IBAction func ExportButtonAct(_ sender: UIButton)     // Sends an email when the button is pressed
    {
        sendEmail()
    }

    func createUsrPicker() {     // Initializes the user viewpicker
        WorkerPickerVal.delegate = self
        WorkerPickerVal.dataSource = self
    }

    
//************************************************* Functions *****************************************************************//
    func CountAdmin() -> Int     // Counts the number of Admin users on record
    {
        var count = 0
        for u in UserCollection
        {
            if u.Admin
            {
                count = count + 1
            }
        }
        return count
    }

    func Popup(Message: String)     // Displays a popup with a given message
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


//************************************************* Extensions ****************************************************************//
extension AdminViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    public func numberOfComponents(in pickerView: UIPickerView) -> Int     // returns the number of viewes in the picker
    {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int     // returns the number of items in the picker
    {
        return UserCollection.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?     // returns a name for each item in the picker
    {
        return UserCollection[row].Username
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)     // returns an object for a given item in the picker
    {
        selectedItem = UserCollection[row].description
    }
    
//************************************************* Email Extensions **********************************************************//
    func sendEmail() {     // sends an email with the data of Roomdata.csv and CheckoutRecords.csv; clears the two files
        if MFMailComposeViewController.canSendMail()
        {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setSubject("ASFC Records" + IO().gettimestamp())
            var message = "---------- Room Data ----------"
            message += "\nDate,Workername,2Colab,2Prayer,2Activity,2Game,2Hallways,2Other,1Common,1Commuter,1Media,1Hive,1Breakout,1GreatRoom,1Mail,1Hallways,1Other"
            message += IO().readfromfile(fileName: "Roomdata.csv")
            message += "\n---------- Checkout Data ----------"
            message += "\nStudentName,StudentID,ItemOut,HDMIOut?,PhoneOut?,Controllers"
            message += IO().readfromfile(fileName: "CheckoutRecords.csv")
            mail.setMessageBody(message, isHTML: false)
            var email = (PrefEmailLabelVal.text?.description)!
            if (email == "")
            {
                email = "EmanuelVilliger@letu.edu"
            }
            mail.setToRecipients([email])
            self.present(mail, animated: true)
        }
        else
        {
            Popup(Message: "This device cannot send email")
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)     // Responds to email actions
    {
        switch result
        {
        case .sent:
            print("You sent the email.")
            _ = IO().clearFile(fileName: "CheckoutRecords.csv")
            _ = IO().clearFile(fileName: "Roomdata.csv")
        case .saved:
            print("You saved a draft of this email")
        case .cancelled:
            print("You cancelled sending this email.")
        case .failed:
            print("Mail failed:  An error occurred when trying to compose this email")
        default:
            print("An error occurred when trying to compose this email")
        }
        controller.dismiss(animated: true, completion: nil)
    }

}
