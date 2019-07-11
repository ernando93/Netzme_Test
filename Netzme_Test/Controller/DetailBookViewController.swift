//
//  DetailBookViewController.swift
//  Netzme_Test
//
//  Created by Ernando Kasaluhe on 11/07/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit
import SDWebImage
import Cosmos


class DetailBookViewController: UIViewController {

    var volumeInfo: VolumeInfo?
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var imageBookCover: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelcategory: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var labelRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showAnimate()
        setupContentView()
    }
}

//MARK: - Setup
extension DetailBookViewController {
    func setupContentView() {
        view.backgroundColor = UIColor(red: 74.0/255.0, green: 73.0/255.0, blue: 74.0/255.0, alpha: 0.90)
        viewContainer.layer.cornerRadius = 8.0
        imageBookCover.sd_setImage(with: URL(string: volumeInfo?.imageLinks?.thumbnail ?? ""), placeholderImage: UIImage(named: "bookPlaceholder"))
        labelTitle.text = volumeInfo?.title
        let author = volumeInfo?.authors.joined(separator: ",") ?? ""
        labelAuthor.text = author
        let category = volumeInfo?.categories.joined(separator: ",") ?? ""
        labelcategory.text = category
        ratingView.rating = volumeInfo?.averageRating ?? 0.0
        labelRating.text = "\(volumeInfo?.ratingsCount ?? 0) Ratings"
    }
    
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.setupShowViewContainer()
        });
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.5, animations: {
            self.viewContainer.isHidden = true
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished) {
                self.view.removeFromSuperview()
            }
        });
    }
    
    func setupShowViewContainer() {
        let transition = CATransition()
        transition.type = CATransitionType.push
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.fillMode = CAMediaTimingFillMode.forwards
        transition.duration = 0.5
        transition.subtype = CATransitionSubtype.fromTop
        self.viewContainer.layer.add(transition, forKey: nil)
    }
    
    func setupHideViewContainer() {
        let transition = CATransition()
        transition.type = CATransitionType.push
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        transition.fillMode = CAMediaTimingFillMode.forwards
        transition.duration = 0.5
        transition.subtype = CATransitionSubtype.fromBottom
        self.viewContainer.layer.add(transition, forKey: nil)
        removeAnimate()
    }
}

//MARK: - Action
extension DetailBookViewController {
    @IBAction func buttonBack(_ sender: UIButton) {
        setupHideViewContainer()
    }
}
