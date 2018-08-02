//
//  PatrollingStaffTableView.swift
//  OnCall
//
//  Created by ABC on 10/08/16.
//  Copyright © 2016 developer. All rights reserved.
//

import UIKit


protocol PatrollingTableViewDelegate {
    func onItemClick(dateString:Date, textField: UITextField)
}

class PatrollingStaffTableView: UIView {
    var delegate:PatrollingTableViewDelegate!
    var datePickerView: UIDatePicker!
    var textField: UITextField!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        if datePickerView == nil{
            datePickerView = UIDatePicker()
            setupView(frame: rect)
        }
    }
    
    func setupView(frame: CGRect){

        datePickerView.removeFromSuperview()
        datePickerView.datePickerMode = .date
        datePickerView.maximumDate = Date()
        let date = "01-01-1950".dateFromString(format: .dmyDate)
        datePickerView.minimumDate = date
        datePickerView.timeZone = TimeZone(abbreviation: "GMT")
        datePickerView.frame = CGRect(x: 0, y: 5, width: frame.size.width, height: frame.size.height - 10)
        datePickerView.layer.masksToBounds = true
        datePickerView.addTarget(self, action: #selector(self.didPickerViewValueChanged(sender:)), for: .valueChanged)
        self.addSubview(datePickerView)
    }
    
}
extension String {
    
    func dateFromString(format: DateFormat) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        dateFormatter.locale =  NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        //debugPrint("End date in date from string method \(dateFormatter.date(from: self))")
        return dateFormatter.date(from: self)
    }
    
}

enum DateFormat: String {
    case dateTime = "yyyy-MM-dd HH:mm:ss"
    case mdyDate = "MM-dd-yyyy"
    case ymdDate = "yyyy-MM-dd"
    case dmyDate = "dd-MM-yyyy"
    case time = "HH:mm"
    case localTime = "hh:mm a"
}
extension PatrollingStaffTableView {
    @objc func didPickerViewValueChanged(sender: UIDatePicker) {
        delegate.onItemClick(dateString: sender.date,textField: textField)
        
    }
}



