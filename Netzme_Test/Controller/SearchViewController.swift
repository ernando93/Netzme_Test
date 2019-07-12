//
//  SearchViewController.swift
//  Netzme_Test
//
//  Created by Ernando Kasaluhe on 11/07/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var results: Results?
    var items = [Items]()
    var volumeInfo: VolumeInfo?
    var imageLinks: ImageLinks?
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContentView()
    }
}

//MARK: - Setup
extension SearchViewController {
    func setupContentView() {
        setupSearchView(view: searchView)
        setupTextField(textField: searchTextField)
        setupTableView(tableView: tableView)
        tableView.isHidden = items.count == 0 ? true : false
    }
    
    func setupSearchView(view: UIView) {
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(red: 178.0/255.0, green: 178.0/255.0, blue: 178.0/255.0, alpha: 1.0).cgColor
    }
    
    func setupTextField(textField: UITextField) {
        textField.placeholder = "Search Books"
        textField.layer.cornerRadius = 6.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.clear.cgColor
        
        textField.layer.shadowColor = UIColor.lightGray.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        textField.layer.shadowRadius = 1.0
        textField.layer.shadowOpacity = 1.0
        textField.layer.masksToBounds = false
        
        let imageViewLeft = UIImageView(frame: CGRect(x: 10, y: 0, width: 21, height: 21))
        imageViewLeft.image = UIImage(named: "searchIcon")
        let viewLeft: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 21))
        viewLeft.addSubview(imageViewLeft)
        textField.leftView = viewLeft
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    func setupTableView(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "BooksTableViewCell", bundle: nil), forCellReuseIdentifier: "booksCell")
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
    }
}

//MARK: - Request
extension SearchViewController {
    func requestBookAPI(text: String) {
        Results.getItems(withQ: text) { result in
            
            switch result {
                
            case .success(let response):
                self.results = response
                self.items = response.items
                self.labelCount.text = "\(response.totalItems) Results"
                self.tableView.isHidden = response.items.count == 0 ? true : false
                self.labelText.text = text.count >= 3 && response.items.count == 0 ? "Nothing result :(" : "Search your favorite book"
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
                self.tableView.isHidden = self.items.count == 0 ? true : false
                self.labelText.text = "Something wrong"
            }
        }
    }
}

//MARK: - TextField Delegate
extension SearchViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(textField: UITextField) {
        if textField.text != "" {
            if textField.text!.count >= 3 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.requestBookAPI(text: textField.text ?? "")
                }
            }
        } else {
            labelCount.text = "0 Results"
            labelText.text = "Search your favorite book"
            items.removeAll()
            tableView.isHidden = items.count == 0 ? true : false
            tableView.reloadData()
        }
    }
}

//MARK: - TableView Delegate & DataSource
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "booksCell", for: indexPath) as? BooksTableViewCell {
            
            let data = items[indexPath.row]
            cell.configureCell(data: data)
            
            return cell
        } else {
            return BooksTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = items[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailBookViewController
        vc.volumeInfo = data.volumeInfo
        self.addChild(vc)
        vc.view.frame = self.view.frame
        self.view.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
