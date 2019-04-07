//
//  SecondViewController.swift
//  ASFC Data Management
//
//  Created by Micah Connor on 10/11/17.
//  Copyright © 2017 Eklektik Design. All rights reserved.
//


//************************************************* Imports ********************************************************************//
import UIKit


//************************************************* PatronViewController Class *************************************************//
class SecondViewController: UIViewController
{

    
//************************************************* Control Handlers ***********************************************************//
    @IBOutlet weak var SubTitleLabelVar: UILabel!

    @IBOutlet weak var ColabLabelVal: UITextField!
    @IBOutlet weak var ColabSliderVal: UISlider!

    @IBOutlet weak var PrayerLabelVal: UITextField!
    @IBOutlet weak var PrayerSliderVal: UISlider!

    @IBOutlet weak var ActivitySliderVal: UISlider!
    @IBOutlet weak var ActivityLabelVal: UITextField!

    @IBOutlet weak var GameSliderVal: UISlider!
    @IBOutlet weak var GameLabelVal: UITextField!

    @IBOutlet weak var Hallways2SliderVal: UISlider!
    @IBOutlet weak var Hallways2LabelVal: UITextField!

    @IBOutlet weak var Other2SliderVal: UISlider!
    @IBOutlet weak var Other2LabelVal: UITextField!

    @IBOutlet weak var CommonSliderVal: UISlider!
    @IBOutlet weak var CommonLabelVal: UITextField!

    @IBOutlet weak var CommuterSliderVal: UISlider!
    @IBOutlet weak var CommuterLabelVal: UITextField!

    @IBOutlet weak var MediaSliderVal: UISlider!
    @IBOutlet weak var MediaLabelVal: UITextField!

    @IBOutlet weak var HiveSliderVal: UISlider!
    @IBOutlet weak var HiveLabelVal: UITextField!

    @IBOutlet weak var BreakoutSliderVal: UISlider!
    @IBOutlet weak var BreakoutLabelVal: UITextField!

    @IBOutlet weak var GreatRoomSliderVal: UISlider!
    @IBOutlet weak var GreatRoomLabelVal: UITextField!

    @IBOutlet weak var MailSliderVal: UISlider!
    @IBOutlet weak var MailLabelVal: UITextField!

    @IBOutlet weak var Hallways1SliderVal: UISlider!
    @IBOutlet weak var Hallways1LabelVal: UITextField!

    @IBOutlet weak var Other1SliderVal: UISlider!
    @IBOutlet weak var Other1LabelVal: UITextField!

   
//************************************************* Local Variables ************************************************************//
    var ColabMax: Float = 50.0
    var PrayerMax: Float = 10.0
    var ActivityMax: Float = 50.0
    var GameMax: Float = 50.0
    var Hallways2Max: Float = 50.0
    var Other2Max: Float = 50.0
    var CommonMax: Float = 80.0
    var CommuterMax: Float = 50.0
    var MediaMax: Float = 50.0
    var HiveMax: Float = 50.0
    var BreakoutMax: Float = 50.0
    var GreatRoomMax: Float = 300.0
    var MailMax: Float = 50.0
    var Hallways1Max: Float = 50.0
    var Other1Max: Float = 50.0
    
    
//************************************************* Page Load Functions ********************************************************//
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetSliders()
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
    
    
//************************************************* Control Actions ************************************************************//
    //This section updates the text of a rooms label with its slider's value
    @IBAction func ColabSliderAct(_ sender: UISlider)
    {
        ColabLabelVal.text = Int(ColabSliderVal.value * ColabMax).description
    }

    @IBAction func PrayerSliderAct(_ sender: UISlider)
    {
        PrayerLabelVal.text = Int(PrayerSliderVal.value * PrayerMax).description
    }

    @IBAction func ActivitySliderAct(_ sender: UISlider)
    {
        ActivityLabelVal.text = Int(ActivitySliderVal.value * ActivityMax).description
    }

    @IBAction func GameSliderAct(_ sender: UISlider)
    {
        GameLabelVal.text = Int(GameSliderVal.value * GameMax).description
    }

    @IBAction func Hallways2SliderAct(_ sender: UISlider)
    {
        Hallways2LabelVal.text = Int(Hallways2SliderVal.value * Hallways2Max).description
    }

    @IBAction func Others2SliderAct(_ sender: UISlider)
    {
        Other2LabelVal.text = Int(Other2SliderVal.value * Other2Max).description
    }

    @IBAction func CommonSliderAct(_ sender: UISlider)
    {
        CommonLabelVal.text = Int(CommonSliderVal.value * CommonMax).description
    }

    @IBAction func CommuterSliderAct(_ sender: UISlider)
    {
        CommuterLabelVal.text = Int(CommuterSliderVal.value * CommuterMax).description
    }

    @IBAction func MediaSliderAct(_ sender: UISlider)
    {
        MediaLabelVal.text = Int(MediaSliderVal.value * MediaMax).description
    }

    @IBAction func HiveSliderAct(_ sender: UISlider)
    {
        HiveLabelVal.text = Int(HiveSliderVal.value * HiveMax).description
    }

    @IBAction func BreakoutSliderAct(_ sender: UISlider)
    {
        BreakoutLabelVal.text = Int(BreakoutSliderVal.value * BreakoutMax).description
    }

    @IBAction func GreatRoomSliderAct(_ sender: UISlider)
    {
        GreatRoomLabelVal.text = Int(GreatRoomSliderVal.value * GreatRoomMax).description
    }

    @IBAction func MailSliderAct(_ sender: UISlider)
    {
        MailLabelVal.text = Int(MailSliderVal.value * MailMax).description
    }

    @IBAction func Hallways1SliderAct1(_ sender: UISlider)
    {
        Hallways1LabelVal.text = Int(Hallways1SliderVal.value * Hallways1Max).description
    }

    @IBAction func Other1SliderAct(_ sender: UISlider)
    {
        Other1LabelVal.text = Int(Other1SliderVal.value * Other1Max).description
    }

    //MARK: Label Action Code
    // This section updates a slider when its respective text field has been changed
    @IBAction func ColabLabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(ColabLabelVal.text!)
        if LocalLabelVal! < ColabMax
        {
            ColabSliderVal.value = LocalLabelVal! / ColabMax
        }
        else
        {
            ColabSliderVal.value = 1
        }
    }

    @IBAction func PrayerLabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(PrayerLabelVal.text!)
        if LocalLabelVal! < PrayerMax
        {
            PrayerSliderVal.value = LocalLabelVal! / PrayerMax
        }
        else
        {
            PrayerSliderVal.value = 1
        }
    }

    @IBAction func ActivityLabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(ActivityLabelVal.text!)
        if LocalLabelVal! < ActivityMax
        {
            ActivitySliderVal.value = LocalLabelVal! / ActivityMax
        }
        else
        {
            ActivitySliderVal.value = 1
        }
    }

    @IBAction func GameLabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(GameLabelVal.text!)
        if LocalLabelVal! < GameMax
        {
            GameSliderVal.value = LocalLabelVal! / GameMax
        }
        else
        {
            GameSliderVal.value = 1
        }
    }

    @IBAction func Hallways2LabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(Hallways2LabelVal.text!)
        if LocalLabelVal! < Hallways2Max
        {
            Hallways2SliderVal.value = LocalLabelVal! / Hallways2Max
        }
        else
        {
            Hallways2SliderVal.value = 1
        }
    }

    @IBAction func Other2LabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(Other2LabelVal.text!)
        if LocalLabelVal! < Other2Max
        {
            Other2SliderVal.value = LocalLabelVal! / Other2Max
        }
        else
        {
            Other2SliderVal.value = 1
        }
    }

    @IBAction func CommonLabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(CommonLabelVal.text!)
        if LocalLabelVal! < CommonMax
        {
            CommonSliderVal.value = LocalLabelVal! / CommonMax
        }
        else
        {
            CommonSliderVal.value = 1
        }
    }

    @IBAction func CommuterLabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(CommuterLabelVal.text!)
        if LocalLabelVal! < CommuterMax
        {
            CommuterSliderVal.value = LocalLabelVal! / CommuterMax
        }
        else
        {
            CommuterSliderVal.value = 1
        }
    }

    @IBAction func MediaLabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(MediaLabelVal.text!)
        if LocalLabelVal! < MediaMax
        {
            MediaSliderVal.value = LocalLabelVal! / MediaMax
        }
        else
        {
            MediaSliderVal.value = 1
        }
    }

    @IBAction func HiveLabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(HiveLabelVal.text!)
        if LocalLabelVal! < HiveMax
        {
            HiveSliderVal.value = LocalLabelVal! / HiveMax
        }
        else
        {
            HiveSliderVal.value = 1
        }
    }

    @IBAction func BreakoutLabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(BreakoutLabelVal.text!)
        if LocalLabelVal! < BreakoutMax
        {
            BreakoutSliderVal.value = LocalLabelVal! / BreakoutMax
        }
        else
        {
            BreakoutSliderVal.value = 1
        }
    }

    @IBAction func GreatRoomLabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(GreatRoomLabelVal.text!)
        if LocalLabelVal! < GreatRoomMax
        {
            GreatRoomSliderVal.value = LocalLabelVal! / GreatRoomMax
        }
        else
        {
            GreatRoomSliderVal.value = 1
        }
    }

    @IBAction func MailLabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(MailLabelVal.text!)
        if LocalLabelVal! < MailMax
        {
            MailSliderVal.value = LocalLabelVal! / MailMax
        }
        else
        {
            MailSliderVal.value = 1
        }
    }

    @IBAction func Hallways1LabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(Hallways1LabelVal.text!)
        if LocalLabelVal! < Hallways1Max
        {
            Hallways1SliderVal.value = LocalLabelVal! / Hallways1Max
        }
        else
        {
            Hallways1SliderVal.value = 1
        }
    }

    @IBAction func Other1LabelAct(_ sender: UITextField)
    {
        let LocalLabelVal: Float? = Float(Other1LabelVal.text!)
        if LocalLabelVal! < Other1Max
        {
            Other1SliderVal.value = LocalLabelVal! / Other1Max
        }
        else
        {
            Other1SliderVal.value = 1
        }
    }

    @IBAction func RecordButtonAct(_ sender: UIButton)     // Writes the current room numbers to Roomdata.csv and resets the page
    {
        var Output = ""
        Output = Output + IO().gettimestamp()
        Output = Output + "," + LoggedInUser.name
        Output = Output + "," + Int(ColabSliderVal.value * ColabMax).description
        Output = Output + "," + Int(PrayerSliderVal.value * PrayerMax).description
        Output = Output + "," + Int(ActivitySliderVal.value * ActivityMax).description
        Output = Output + "," + Int(GameSliderVal.value * GameMax).description
        Output = Output + "," + Int(Hallways2SliderVal.value * Hallways2Max).description
        Output = Output + "," + Int(Other2SliderVal.value * Other2Max).description
        Output = Output + "," + Int(CommonSliderVal.value * CommonMax).description
        Output = Output + "," + Int(CommuterSliderVal.value * CommuterMax).description
        Output = Output + "," + Int(MediaSliderVal.value * MediaMax).description
        Output = Output + "," + Int(HiveSliderVal.value * HiveMax).description
        Output = Output + "," + Int(BreakoutSliderVal.value * BreakoutMax).description
        Output = Output + "," + Int(GreatRoomSliderVal.value * GreatRoomMax).description
        Output = Output + "," + Int(MailSliderVal.value * MailMax).description
        Output = Output + "," + Int(Hallways1SliderVal.value * Hallways1Max).description
        Output = Output + "," + Int(Other1SliderVal.value * Other1Max).description

        _ = IO().writetofile(text: Output, fileName: "Roomdata.csv")
        updateView()
        resetSliders()
    }

    
//************************************************* Functions ******************************************************************//
    func resetSliders()     // Resets the labels and sliders to their midvalue
    {
        ColabLabelVal.text = (ColabMax / 2.0).description
        PrayerLabelVal.text = (PrayerMax / 2.0).description
        ActivityLabelVal.text = (ActivityMax / 2.0).description
        GameLabelVal.text = (GameMax / 2.0).description
        Hallways2LabelVal.text = (Hallways2Max / 2.0).description
        Other2LabelVal.text = (Other2Max / 2.0).description
        CommonLabelVal.text = (CommonMax / 2.0).description
        CommuterLabelVal.text = (CommuterMax / 2.0).description
        MediaLabelVal.text = (MediaMax / 2.0).description
        HiveLabelVal.text = (HiveMax / 2.0).description
        BreakoutLabelVal.text = (BreakoutMax / 2.0).description
        GreatRoomLabelVal.text = (GreatRoomMax / 2.0).description
        MailLabelVal.text = (MailMax / 2.0).description
        Hallways1LabelVal.text = (Hallways1Max / 2.0).description
        Other1LabelVal.text = (Other1Max / 2.0).description

        ColabSliderVal.value = 0.5
        PrayerSliderVal.value = 0.5
        ActivitySliderVal.value = 0.5
        GameSliderVal.value = 0.5
        Hallways2SliderVal.value = 0.5
        Other2SliderVal.value = 0.5
        CommonSliderVal.value = 0.5
        CommuterSliderVal.value = 0.5
        MediaSliderVal.value = 0.5
        HiveSliderVal.value = 0.5
        BreakoutSliderVal.value = 0.5
        GreatRoomSliderVal.value = 0.5
        MailSliderVal.value = 0.5
        Hallways1SliderVal.value = 0.5
        Other1SliderVal.value = 0.5
    }

    func updateView()     // Refreshes the window with the latest data
    {
        var RoomCollection: [RoomItem] = []
        RoomCollection = StatisticsViewController().parseRoom()
        
        if (RoomCollection.count > 0)
        {
            let room: RoomItem = RoomCollection[RoomCollection.count - 1]
            SubTitleLabelVar.text = "Last round done by " + room.WName + " at " + IO().gettimestamp(date: room.Time)
        }
        else
        {
                SubTitleLabelVar.text = "No history recorded"
        }
    }
}
