//
//  InventoryViewController.swift
//  ASFC Data Management
//
//  Created by Micah Connor on 10/27/17.
//  Copyright © 2017 Eklektik Design. All rights reserved.
//


//************************************************* Imports ***********************************************************************//
import UIKit


//************************************************* InvItem Struct ****************************************************************//
struct InvItem
{
    let ItemType: String
    let ItemName: String
    let Quantity: Int

    var description: String     // Prints out the contents of an inventory item
    {
        return "\(ItemType),\(ItemName),\(Quantity.description)"
    }
}


//************************************************* InventoryViewController Class *************************************************//
class InventoryViewController: UIViewController
{
    
    
//************************************************* Control Handlers **************************************************************//
    @IBOutlet weak var TypeTextboxVal: UITextField!
    @IBOutlet weak var NameTextboxVal: UITextField!
    @IBOutlet weak var QuantityLabelVal: UITextField!
    @IBOutlet weak var QuantityStepperVal: UIStepper!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var TempTextBox: UITextField!
    @IBOutlet weak var ItemPickerVal: UIPickerView!

    
//************************************************* Local Variables ***************************************************************//
    let localfile = "Inventory.csv"
    var ItemCollection: [InvItem] = []
    var selectedItem: String?

    
//************************************************* Page Load Functions ***********************************************************//
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        QuantityStepperVal.value = 0
        ItemCollection = parseInventory()
        createInvPicker()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//************************************************* Control Actions ***************************************************************//
    @IBAction func QuantityStepperAct(_ sender: UIStepper)     // Updates the label value when the stepper is adjusted
    {
        QuantityLabelVal.text = Int(QuantityStepperVal.value).description
    }

    @IBAction func AddButtonAct(_ sender: UIButton)     // Adds a new inventory item when the button is pressed
    {
        if ((TypeTextboxVal.text?.description.contains(","))! || (NameTextboxVal.text?.description.contains(","))!)
        {
            Popup(Message: "Please Remove Commas (,) ")
        }
        else
        {
            let NewItem: InvItem = InvItem(ItemType: (TypeTextboxVal.text?.description)!, ItemName: (NameTextboxVal.text?.description)!, Quantity: Int(QuantityStepperVal.value))
            ItemCollection.append(NewItem)
            _ = IO().writetofile(text: NewItem.description, fileName: localfile)
            ItemPickerVal.dataSource = self
            TypeTextboxVal.text = ""
            NameTextboxVal.text = ""
            QuantityLabelVal.text = "0"
            QuantityStepperVal.value = 0
        }
    }

    @IBAction func RemoveButtonAct(_ sender: UIButton)     // Removes the selected inventory item
    {
        if (ItemCollection.count - 1 > 0)
        {
            ItemCollection.remove(at: ItemPickerVal.selectedRow(inComponent: 0))
            _ = IO().clearFile(fileName: localfile)
            for i in ItemCollection
            {
                _ = IO().writetofile(text: i.description, fileName: localfile)
            }
            ItemPickerVal.dataSource = self
        }
        else
        {
            Popup(Message: "The inventory must always have at least one item")
        }
    }

    
//************************************************* Functions *********************************************************************//
    func parseInventory() -> [InvItem]     // Reads the Inventory.csv file and returns a list of usable objects
    {
        var Inventory: [InvItem] = []
        let StrInvDB: String = IO().readfromfile(fileName: localfile)
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

    func createInvPicker()     // Creates the inventory picker view
    {
        ItemPickerVal.delegate = self
        ItemPickerVal.dataSource = self
    }

    @IBAction func QuantityLabelAct(_ sender: UITextField)     // Updates the stepper when the label is changed
    {
        QuantityStepperVal.value = Double(QuantityLabelVal.text!)!
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


//************************************************* Extensions ********************************************************************//
extension InventoryViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    public func numberOfComponents(in pickerView: UIPickerView) -> Int     // Returns the number of views for the picker view
    {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int     // Returns the number of items in the picker view
    {
        return ItemCollection.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?     // Returns a name for every item in the picker view
    {
        return ItemCollection[row].description
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)     // Returns an object for the selected item in the picker view
    {
        selectedItem = ItemCollection[row].description
    }
}
