//
//  TimeHelper.swift
//  TrackHub
//
//  Created by Assumani, Medi on 4/3/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import UIKit

public class TimeHelper{
    // - MARK :  Properties
    static public var singleton = TimeHelper()
    
    // - MARK : METHODS
    public func displayGreeting(greetingTextView: UITextView){
        let currentDate = Date()
        let currentHour = Calendar.current.component(.hour, from: currentDate)
        
        if currentHour >= 0 && currentHour <= 11{
            timeIsMorning(textView: greetingTextView)
        }else if currentHour >= 12 && currentHour < 17{
            timeIsAfteroon(textView: greetingTextView)
        }else if currentHour >= 17 && currentHour < 20{
            timeIsEvening(textView: greetingTextView)
        }else if currentHour >= 20 && currentHour < 24{
            timeIsNight(textView: greetingTextView)
        }
        
    }
    
    fileprivate func timeIsMorning(textView: UITextView){
        textView.text = "Good Morning"
    }
    
    fileprivate func timeIsAfteroon(textView: UITextView){
        textView.text = "Good Afternoon"
    }
    
    fileprivate func timeIsEvening(textView: UITextView){
        textView.text = "Good Evening"
    }
    
    fileprivate func timeIsNight(textView: UITextView){
        textView.text = "Good Night"
    }
}

