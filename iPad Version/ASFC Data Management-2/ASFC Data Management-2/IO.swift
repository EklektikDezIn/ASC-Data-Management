//
//  IO.swift
//  ASFC Data Management
//
//  Created by Micah Connor on 11/15/17.
//  Copyright © 2017 Eklektik Design. All rights reserved.
//


//************************************************* Imports **************************************************//
import MessageUI


//************************************************* IO Class *************************************************//
class IO
{
    
    
//************************************************* Functions ************************************************//
    func getFileURL(fileName: String) -> URL     // Adds the file path to a specified file name
    {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileURL = dir?.appendingPathComponent(fileName)
        return fileURL!
    }

    func clearFile(fileName: String) -> Bool     // Removes all contents from a given file
    {
        //https://stackoverflow.com/questions/32163420/deleting-contents-of-text-file

        let fileURL = getFileURL(fileName: fileName)
        let text = ""
        do
        {
            try text.write(to: fileURL, atomically: false, encoding: String.Encoding.utf8)
            return true
        }
        catch
        {
            print("Error creating \(fileURL)")
            return false
        }
    }

    func gettimestamp() -> String     // Returns the current time as a string
    {
        //https://stackoverflow.com/questions/24070450/how-to-get-the-current-time-as-datetime

        let date = Date()
        let calendar = Calendar.current
        
        var day = ("0" + calendar.component(.day, from: date).description)
        day = day.substring(from: day.index(day.endIndex, offsetBy: -2))
        
        var month = ("0" + calendar.component(.month, from: date).description)
        month = month.substring(from: month.index(month.endIndex, offsetBy: -2))
        
        let year = calendar.component(.year, from: date).description
        var hour = ("0" + calendar.component(.hour, from: date).description)
        hour = hour.substring(from: hour.index(hour.endIndex, offsetBy: -2))
        
        var minutes = ("0" + calendar.component(.minute, from: date).description)
        minutes = minutes.substring(from: minutes.index(minutes.endIndex, offsetBy: -2))

        return month + "/" + day + "/" + year + " " + hour + ":" + minutes
    }
    
    func gettimestamp(date: Date) -> String     // Converts a given date to a string
    {
        //https://stackoverflow.com/questions/24070450/how-to-get-the-current-time-as-datetime

        let calendar = Calendar.current
        
        var day = ("0" + calendar.component(.day, from: date).description)
        day = day.substring(from: day.index(day.endIndex, offsetBy: -2))
        
        var month = ("0" + calendar.component(.month, from: date).description)
        month = month.substring(from: month.index(month.endIndex, offsetBy: -2))
        
        let year = calendar.component(.year, from: date).description
        var hour = ("0" + calendar.component(.hour, from: date).description)
        hour = hour.substring(from: hour.index(hour.endIndex, offsetBy: -2))
        
        var minutes = ("0" + calendar.component(.minute, from: date).description)
        minutes = minutes.substring(from: minutes.index(minutes.endIndex, offsetBy: -2))

        return month + "/" + day + "/" + year + " " + hour + ":" + minutes
    }

    func readfromfile(fileName: String) -> String     // Reads the contents of a specified file
    {
        var text: String = ""
        let filePath = getFileURL(fileName: fileName)
        do
        {
            text = try String(contentsOf: filePath, encoding: .utf8)
        }
        catch
        {
            
        }
        return text
    }

    func writetofile(text: String, fileName: String) -> Bool     // Writes a given message to a specified file
    {

        let textrn = "\n" + text
        let fileURL = getFileURL(fileName: fileName)

        print(fileURL)
        do
        {
            try textrn.appendToURL(fileURL: fileURL)
            print("TRUE")
            return true
        }
        catch
        {
            print("FALSE")
            return false
        }
    }
    
    func createStartFiles()     // Initializes files for first time run
    {
        _ = clearFile(fileName: "Inventory.csv")
        _ = clearFile(fileName: "Users.csv")
        _ = clearFile(fileName: "CheckoutRecords.csv")
        _ = clearFile(fileName: "CurrentCheckouts.csv")
        _ = clearFile(fileName: "Roomdata.csv")
        _ = writetofile(text: "Remove_this_item,At_setup,0", fileName: "Inventory.csv")
        _ = writetofile(text: "Username...,Password...,true", fileName: "Users.csv")
    }
}


//************************************************* Extensions ***********************************************//
//https://stackoverflow.com/questions/27327067/append-text-or-data-to-text-file-in-swift
extension String
{
    func appendLineToURL(fileURL: URL) throws     // Writes a given message to the end of a file
    {
        try (self + "\n").appendToURL(fileURL: fileURL)
    }

    func appendToURL(fileURL: URL) throws     // Writes a given message to the end of a file
    {
        let data = self.data(using: String.Encoding.utf8)!
        try data.append(fileURL: fileURL)
    }
}


extension Data
{
    func append(fileURL: URL) throws     // Writes a given message to the end of a file
    {
        if let fileHandle = FileHandle(forWritingAtPath: fileURL.path)
        {
            defer
            {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.write(self)
        }
            else
        {
                try write(to: fileURL, options: .atomic)
        }
    }
}


//************************************************* Globals Class ********************************************//
class Globals
{
    var name: String
    init(name: String)     // Stores a string for a Globals
    {
        self.name = name
    }
    func update(Name: String)     // Updates the string of the Globals
    {
        self.name = Name
    }
}

var LoggedInUser = Globals(name: "None")

