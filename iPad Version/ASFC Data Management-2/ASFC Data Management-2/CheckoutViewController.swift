//
//  CheckoutViewController.swift
//  ASFC Data Management
//
//  Created by Micah Connor on 10/27/17.
//  Copyright © 2017 Eklektik Design. All rights reserved.
//


//************************************************* Imports **********************************************************************//
import UIKit


//************************************************* ChkItem Struct ***************************************************************//
struct ChkItem
{
    let Time: Date
    let Wname: String
    let StudentName: String
    let StudentID: String
    let ItemOut: String
    let HDMIOut: Bool
    let PhoneOut: Bool
    let ContCount: Int

    var description: String     // Prints out the contents of Checkout Item
    {
        return "\(IO().gettimestamp(date: Time)),\(Wname),\(StudentName),\(StudentID),\(ItemOut),\(HDMIOut.description),\(PhoneOut.description),\(ContCount.description)"
    }
}


//************************************************* CheckoutViewController Class *************************************************//
class CheckoutViewController: UIViewController
{
    
    
//************************************************* Control Handlers *************************************************************//
    @IBOutlet weak var StudentNameInputVal: UITextField!
    @IBOutlet weak var StudentIDInputVal: UITextField!
    @IBOutlet weak var HDMISwitchVal: UISwitch!
    @IBOutlet weak var PhoneSwitchVal: UISwitch!
    @IBOutlet weak var ControllerInputVal: UITextField!
    @IBOutlet weak var ControllerStepperVal: UIStepper!
    @IBOutlet weak var CheckoutPickerVal: UIPickerView!
    @IBOutlet weak var TypePickerVal: UIPickerView!
    @IBOutlet weak var ITemPickerVal: UIPickerView!

    
//************************************************* Local Variables **************************************************************//
    let localfileCurrent = "CurrentCheckouts.csv"
    let localfileGeneral = "CheckoutRecords.csv"
    let inventoryFile = "Inventory.csv"
    var InventoryCollection: [InvItem] = []
    var CheckoutCollection: [ChkItem] = []
    var TypeCollection: [String] = []
    var ItemCollection: [String] = []
    var dateFormatter = DateFormatter()
    var selectedItemCheckout: String?
    var selectedItemType: String?
    var selectedItemItem: String?

    
//************************************************* Page Load Functions **********************************************************//
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ControllerStepperVal.value = 0.0
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        updateView()
    }

    override func viewDidAppear(_ animated: Bool)
    {
        updateView()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//************************************************* Control Actions **************************************************************//
    @IBAction func ControllerStepperAct(_ sender: UIStepper) {     // Updates the label text when the stepper is modified
        ControllerInputVal.text = Int(ControllerStepperVal.value).description
    }

    @IBAction func CheckoutButtonAct(_ sender: UIButton)     // Records an item being checked out
    {
        if((StudentNameInputVal.text?.description.contains(","))! || (StudentIDInputVal.text?.description.contains(","))!)
        {
            Popup(Message: "Please Remove Commas (,) ")
        }
        else
        {
            if(StudentIDInputVal.text?.description != "")
            {
                let NewItem: ChkItem = ChkItem(Time: dateFormatter.date(from: IO().gettimestamp())!, Wname: LoggedInUser.name, StudentName: (StudentNameInputVal.text?.description)!, StudentID: (StudentIDInputVal.text?.description)!, ItemOut: selectedItemItem!, HDMIOut: HDMISwitchVal.isOn, PhoneOut: PhoneSwitchVal.isOn, ContCount: Int(ControllerStepperVal.value))
                CheckoutCollection.append(NewItem)

                _ = IO().writetofile(text: NewItem.description, fileName: localfileCurrent)
                _ = IO().writetofile(text: NewItem.description, fileName: localfileGeneral)
                CheckoutPickerVal.dataSource = self
                StudentNameInputVal.text = ""
                StudentIDInputVal.text = ""
                HDMISwitchVal.isOn = false
                PhoneSwitchVal.isOn = false
                ControllerInputVal.text = "0"
                ControllerStepperVal.value = 0.0
            }
            else
            {
                Popup(Message: "An ID number is required to check out an item")
            }
        }
    }

    @IBAction func ReturnButtonAct(_ sender: UIButton)     // Records the returning of a given item
    {
        if(CheckoutCollection.count > 0)
        {
            CheckoutCollection.remove(at: CheckoutPickerVal.selectedRow(inComponent: 0))
            _ = IO().clearFile(fileName: localfileCurrent)
            for i in CheckoutCollection
            {
                _ = IO().writetofile(text: i.description, fileName: localfileCurrent)
            }
            CheckoutPickerVal.dataSource = self
        }
    }
    
    @IBAction func ControllerLabelAct(_ sender: UITextField)     // Updates the Stepper when the label value changes
    {
        ControllerStepperVal.value = Double(ControllerInputVal.text!)!
    }
    
    
//************************************************* Functions ********************************************************************//
    func parseCheckout() -> [ChkItem]     // Reads the Checkout.csv file and returns its contents as usable objects
    {
        var Inventory: [ChkItem] = []
        let StrChkDB: String = IO().readfromfile(fileName: localfileCurrent)
        if (StrChkDB != "")
        {
            var ChkDBLines = StrChkDB.components(separatedBy: "\n")
            ChkDBLines.removeFirst()
            for line in ChkDBLines
            {
                var linedetails = line.components(separatedBy: ",")
                Inventory.append(ChkItem(Time: dateFormatter.date(from: linedetails[0])!, Wname: linedetails[1], StudentName: linedetails[2], StudentID: linedetails[3], ItemOut: linedetails[4], HDMIOut: Bool(linedetails[5])!, PhoneOut: Bool(linedetails[6])!, ContCount: Int(linedetails[7])!))
            }
        }
        return Inventory
    }

    func parseInventory() -> [InvItem]     // Reads the Inventory.csv file and returns its contents as usable objects
    {
        var Inventory: [InvItem] = []
        let StrInvDB: String = IO().readfromfile(fileName: "Inventory.csv")
        if (StrInvDB != "")
        {
            var InvDBLines = StrInvDB.components(separatedBy: "\n")
            InvDBLines.removeFirst()
            for line in InvDBLines
            {
                var linedetails = line.components(separatedBy: ",")
                Inventory.append(InvItem(ItemType: linedetails[0], ItemName: linedetails[1], Quantity: Int(linedetails[2])!))
            }
        }
        return Inventory
    }

    func getInventoryTypes(Inventory: [InvItem]) -> [String]     // Returns a list of unique types of objects in the inventory
    {
        var Types: [String] = []
        for Record in Inventory
        {
            if (!Types.contains(Record.ItemType))
            {
                Types.append(Record.ItemType)
            }
        }
        return Types
    }
    
    func getInventoryItems(Inventory: [InvItem], Type: String) -> [String]     // Returns the items associated with a given type
    {
        var Types: [String] = []
        for Record in Inventory
        {
            if (Record.ItemType == Type)
            {
                Types.append(Record.ItemName)
            }
        }
        return Types
    }

    func createChkPicker()     // Creates the checked out items view picker
    {
        CheckoutPickerVal.delegate = self
        CheckoutPickerVal.dataSource = self
    }

    func createTypPicker()     // Creates the type view picker
    {
        TypePickerVal.delegate = self
        TypePickerVal.dataSource = self
    }

    func createItmPicker()     // Creates the item view picker
    {
        ITemPickerVal.delegate = self
        ITemPickerVal.dataSource = self
    }

    func updateView()     // Updates the display with the latest values
    {
        ControllerStepperVal.value = 0
        InventoryCollection = parseInventory()
        CheckoutCollection = parseCheckout()
        TypeCollection = getInventoryTypes(Inventory: InventoryCollection)
        ItemCollection = getInventoryItems(Inventory: InventoryCollection, Type: TypeCollection[0].description)
        createChkPicker()
        createTypPicker()
        createItmPicker()

        if (CheckoutCollection.count > 0)
        {
            selectedItemCheckout = CheckoutCollection[0].description
        }
        else
        {
            selectedItemCheckout = ""
        }
        
        if (TypeCollection.count > 0)
        {
            selectedItemType = TypeCollection[0].description
        }
        else
        {
                selectedItemType = ""
        }
        
        if (ItemCollection.count > 0) {
            selectedItemItem = ItemCollection[0].description
        }
        else
        {
                selectedItemItem = ""
        }

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


//************************************************* Extensions *******************************************************************//
extension CheckoutViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    public func numberOfComponents(in pickerView: UIPickerView) -> Int     // Returns the number of views for each picker view
    {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int     // Returns the number of items in each picker view
    {
        if pickerView == CheckoutPickerVal
        {
            return CheckoutCollection.count
        }
        else if pickerView == TypePickerVal
        {
            return TypeCollection.count
        }
        else if pickerView == ITemPickerVal
        {
            return ItemCollection.count
        }
        return 0
    }

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?     // Returns a name for every item in each picker view
    {
        if pickerView == CheckoutPickerVal && CheckoutCollection.count > 0
        {
            var reval = CheckoutCollection[row].StudentName + "," + CheckoutCollection[row].StudentID + "," + CheckoutCollection[row].ItemOut + ","
            if (CheckoutCollection[row].HDMIOut == true){
                reval += "HDMI,"
            }
            if (CheckoutCollection[row].PhoneOut == true){
                reval += "Phone,"
            }
            reval += CheckoutCollection[row].ContCount.description
            return reval
        }
        else if pickerView == TypePickerVal
        {
            return TypeCollection[row].description
        }
        else if pickerView == ITemPickerVal
        {
            return ItemCollection[row].description
        }
        return ""
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)     // Returns an object for a given item in each picker view
    {
        if pickerView == CheckoutPickerVal && CheckoutCollection.count > 0
        {
            selectedItemCheckout = CheckoutCollection[row].description
        }
        else if pickerView == TypePickerVal
        {
            selectedItemType = TypeCollection[row].description
            ItemCollection = getInventoryItems(Inventory: InventoryCollection, Type: selectedItemType!)
            selectedItemItem = ItemCollection[0].description
            ITemPickerVal.dataSource = self

        }
        else if pickerView == ITemPickerVal
        {
            selectedItemItem = ItemCollection[row]
        }
    }
}
