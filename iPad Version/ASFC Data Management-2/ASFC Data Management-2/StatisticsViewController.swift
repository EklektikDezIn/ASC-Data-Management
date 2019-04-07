//
//  StatisticsViewController.swift
//  ASFC Data Management
//
//  Created by Micah Connor on 10/27/17.
//  Copyright © 2017 Eklektik Design. All rights reserved.
//


//************************************************* Imports ************************************************************************//
import UIKit


//************************************************* RoomItem Struct ****************************************************************//
struct RoomItem
{
    let Time: Date
    let WName: String
    let Common1: Int
    let Commuter1: Int
    let Media1: Int
    let Hive1: Int
    let Breakout1: Int
    let GreatRoom1: Int
    let Mail1: Int
    let Hallways1: Int
    let Other1: Int
    let Colab2: Int
    let Prayer2: Int
    let Activity2: Int
    let Game2: Int
    let Hallways2: Int
    let Other2: Int
}


//************************************************* StatisticsViewController Class *************************************************//
class StatisticsViewController: UIViewController
{
    
    //************************************************* Control Handlers ***********************************************************//
    @IBOutlet weak var FirstDatePickerVal: UIDatePicker!
    @IBOutlet weak var LastDatePickerVal: UIDatePicker!
    @IBOutlet weak var Common1LabelDisp: UILabel!
    @IBOutlet weak var Computer1LabelDisp: UILabel!
    @IBOutlet weak var Media1LabelDisp: UILabel!
    @IBOutlet weak var Hive1LabelDisp: UILabel!
    @IBOutlet weak var Breakout1LabelDisp: UILabel!
    @IBOutlet weak var GreatRoom1LabelDisp: UILabel!
    @IBOutlet weak var Mail1LabelDisp: UILabel!
    @IBOutlet weak var Hallways1LabelDisp: UILabel!
    @IBOutlet weak var Other1LabelDisp: UILabel!
    @IBOutlet weak var Colab2LabelDisp: UILabel!
    @IBOutlet weak var Prayer2LabelDisp: UILabel!
    @IBOutlet weak var Activity2LabelDisp: UILabel!
    @IBOutlet weak var Game2LabelDisp: UILabel!
    @IBOutlet weak var Hallways2LabelDisp: UILabel!
    @IBOutlet weak var Other2LabelDisp: UILabel!

    
//************************************************* Local Variables ****************************************************************//
    let localfile = "Roomdata.csv"
    var RoomCollection: [RoomItem] = []
    var avgRooms: RoomItem?
    var dateFormatter = DateFormatter()

    
//************************************************* Page Load Functions ************************************************************//
    override func viewDidLoad()
    {
        super.viewDidLoad()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        avgRooms = clearRoom()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//************************************************* Control Actions ****************************************************************//
    @IBAction func UpdateButtonAct(_ sender: UIButton)     // Updates the display with the average usage of each room over the selected period of time
    {
        RoomCollection = parseRoom()
        var Inrange: Bool = false
        var count: Int = 0
        for ri in RoomCollection {
            if (ri.Time > FirstDatePickerVal.date)
            {
                Inrange = true
            }
            if (Inrange)
            {
                if (ri.Time > LastDatePickerVal.date)
                {
                    break
                }
                if (count == 0)
                {
                    avgRooms = ri
                }
                else
                {
                        avgRooms = addRooms(R1: avgRooms!, R2: ri)
                }
                count = count + 1
            }
        }
        if (count > 0)
        {
            avgRooms = divRooms(R1: avgRooms!, div: count)
        }
        else
        {
                Popup(Message: "No data for specified time period")
                avgRooms = clearRoom()
        }
        displayRoom(R: avgRooms!)
    }
    
    
//************************************************* Functions **********************************************************************//
    func parseRoom() -> [RoomItem]     // Reads the Roomdata.csv file and returns a list of its contents as usable objects
    {
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        var Inventory: [RoomItem] = []
        let StrRoomDB: String = IO().readfromfile(fileName: localfile)
        if (StrRoomDB != "")
        {
            var RoomDBLines = StrRoomDB.components(separatedBy: "\n")
            RoomDBLines.removeFirst()
            for line in RoomDBLines
            {
                var linedetails = line.components(separatedBy: ",")
                Inventory.append(RoomItem(Time: dateFormatter.date(from: linedetails[0])!, WName: linedetails[1], Common1: Int(linedetails[8])!, Commuter1: Int(linedetails[9])!, Media1: Int(linedetails[10])!, Hive1: Int(linedetails[11])!, Breakout1: Int(linedetails[12])!, GreatRoom1: Int(linedetails[13])!, Mail1: Int(linedetails[14])!, Hallways1: Int(linedetails[15])!, Other1: Int(linedetails[16])!, Colab2: Int(linedetails[2])!, Prayer2: Int(linedetails[3])!, Activity2: Int(linedetails[4])!, Game2: Int(linedetails[5])!, Hallways2: Int(linedetails[6])!, Other2: Int(linedetails[7])!))
            }
        }
        return Inventory
    }
    
    func addRooms(R1: RoomItem, R2: RoomItem) -> RoomItem     // Adds the values of every room record together for each room
    {
        return RoomItem(Time: R1.Time, WName: "Total", Common1: R1.Common1 + R2.Common1, Commuter1: R1.Commuter1 + R2.Commuter1, Media1: R1.Media1 + R2.Media1, Hive1: R1.Hive1 + R2.Hive1, Breakout1: R1.Breakout1 + R2.Breakout1, GreatRoom1: R1.GreatRoom1 + R2.GreatRoom1, Mail1: R1.Mail1 + R2.Mail1, Hallways1: R1.Hallways1 + R2.Hallways1, Other1: R1.Other1 + R2.Other1, Colab2: R1.Colab2 + R2.Colab2, Prayer2: R1.Prayer2 + R2.Prayer2, Activity2: R1.Activity2 + R2.Activity2, Game2: R1.Game2 + R2.Game2, Hallways2: R1.Hallways2 + R2.Hallways2, Other2: R1.Other2 + R2.Other2)
    }
    
    func divRooms(R1: RoomItem, div: Int) -> RoomItem     // Divides the values of a room record by a given number
    {
        return RoomItem(Time: R1.Time, WName: "Total", Common1: R1.Common1 / div, Commuter1: R1.Commuter1 / div, Media1: R1.Media1 / div, Hive1: R1.Hive1 / div, Breakout1: R1.Breakout1 / div, GreatRoom1: R1.GreatRoom1 / div, Mail1: R1.Mail1 / div, Hallways1: R1.Hallways1 / div, Other1: R1.Other1 / div, Colab2: R1.Colab2 / div, Prayer2: R1.Prayer2 / div, Activity2: R1.Activity2 / div, Game2: R1.Game2 / div, Hallways2: R1.Hallways2 / div, Other2: R1.Other2 / div)
    }

    func displayRoom(R: RoomItem)     // Updates the labels with the values of a given room
    {
        Common1LabelDisp.text = R.Common1.description
        Computer1LabelDisp.text = R.Commuter1.description
        Media1LabelDisp.text = R.Media1.description
        Hive1LabelDisp.text = R.Hive1.description
        Breakout1LabelDisp.text = R.Breakout1.description
        GreatRoom1LabelDisp.text = R.GreatRoom1.description
        Mail1LabelDisp.text = R.Mail1.description
        Hallways1LabelDisp.text = R.Hallways1.description
        Other1LabelDisp.text = R.Other1.description
        Colab2LabelDisp.text = R.Colab2.description
        Prayer2LabelDisp.text = R.Prayer2.description
        Activity2LabelDisp.text = R.Activity2.description
        Game2LabelDisp.text = R.Game2.description
        Hallways2LabelDisp.text = R.Hallways2.description
        Other2LabelDisp.text = R.Other2.description
    }

    func clearRoom() -> RoomItem     // Returns a room with all values set to Null
    {
        return RoomItem(Time: dateFormatter.date(from: IO().gettimestamp())!, WName: "None", Common1: 0, Commuter1: 0, Media1: 0, Hive1: 0, Breakout1: 0, GreatRoom1: 0, Mail1: 0, Hallways1: 0, Other1: 0, Colab2: 0, Prayer2: 0, Activity2: 0, Game2: 0, Hallways2: 0, Other2: 0)
    }

    func Popup(Message: String)      // Displays a popup window with a given message
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
