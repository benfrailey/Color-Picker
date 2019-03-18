//
//  ViewController.swift
//  picker
//
//  Created by Ben Frailey on 3/17/19.
//  Copyright © 2019 Ben Frailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct Color {
        var name: String
        var type: UIColor
    }
    
    var initialColor = 0
    
    private let dataSource = [Color(name: "Red", type: UIColor.red), Color(name: "Orange", type: UIColor.orange), Color(name: "Yellow", type: UIColor.yellow), Color(name: "Green", type: UIColor.green), Color(name: "Blue", type: UIColor.blue), Color(name: "Purple", type: UIColor.purple)]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerView.selectRow(initialColor, inComponent: 0, animated: false)
        detailLabel.text = dataSource[initialColor].name
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        view.backgroundColor = dataSource[row].type
        detailLabel.text = dataSource[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        view.backgroundColor = dataSource[row].type
        return dataSource[row].name
    }
}

