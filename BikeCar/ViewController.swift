//
//  ViewController.swift
//  BikeCar
//
//  Created by Drivemate IOS on 24/12/2562 BE.
//  Copyright © 2562 Drivemate IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet var searchBar: UISearchBar!
    //    @IBOutlet weak var searchCarTextField: UITextField!
    
    var carArray = [CarDetail]()
    var currentCarArray = [CarDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        //        searchCarTextField.delegate = self
        searchBar.delegate = self
        setUpCar()
//        searchView.isHidden = true
        let nib = UINib(nibName: "CarCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CarCell")
    }
    
    private func setUpCar() {
        carArray.append(CarDetail(carImage: UIImage(named: "test1")!, carName: "BMW S1000RR"))
        carArray.append(CarDetail(carImage: UIImage(named: "test2")!, carName: "Honda"))
        carArray.append(CarDetail(carImage: UIImage(named: "test3")!, carName: "Yamaha"))
        carArray.append(CarDetail(carImage: UIImage(named: "test4")!, carName: "Click"))
        carArray.append(CarDetail(carImage: UIImage(named: "test5")!, carName: "R1M"))
        
        currentCarArray = carArray
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
//    @IBAction func searchAction(_ sender: Any) {
//        searchView.isHidden = false
//    }
    
    //    @IBAction func SearchButtonAction(_ sender: Any) {
    //        currentCarArray = carArray.filter({ animal -> Bool in
    //            if searchCarTextField.text?.isEmpty ?? true { return true }
    //            return animal.carName.lowercased().contains(searchCarTextField.text?.lowercased() ?? "")
    //        })
    //        tableView.reloadData()
    //    }
}

extension ViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCarArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as! CarCell
        cell.carImage.image = currentCarArray[indexPath.row].carImage
        cell.carNameLabel.text = currentCarArray[indexPath.row].carName
        return cell
    }
}

//extension ViewController : UITextFieldDelegate {
//    func textFieldDidChangeSelection(_ textField: UITextField) {
//        currentCarArray = carArray.filter({ animal -> Bool in
//            if searchCarTextField.text?.isEmpty ?? true { return true }
//            return animal.carName.lowercased().contains(searchCarTextField.text?.lowercased() ?? "")
//        })
//        tableView.reloadData()
//    }
//}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentCarArray = carArray.filter({ car -> Bool in
            if searchText.isEmpty { return true }
            return car.carName.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}

struct CarDetail {
    var carImage: UIImage
    var carName: String
}
