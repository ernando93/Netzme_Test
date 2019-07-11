//
//  BooksTableViewCell.swift
//  Netzme_Test
//
//  Created by Ernando Kasaluhe on 10/07/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import UIKit
import SDWebImage

class BooksTableViewCell: UITableViewCell {

    @IBOutlet weak var imageBookCover: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelPublish: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    func configureCell(data: Items) {
        let author = data.volumeInfo?.authors.joined(separator: ",") ?? ""
        setupViewContent(imageUrl: data.volumeInfo?.imageLinks?.thumbnail ?? "", title: data.volumeInfo?.title ?? "", author: author, publish: data.volumeInfo?.publisher ?? "", date: data.volumeInfo?.publishedDate ?? "")
    }
}

//MARK: - Setup
extension BooksTableViewCell {
    func setupViewContent(imageUrl: String, title: String, author: String, publish: String, date: String) {
        setupImageCover(withImageView: imageBookCover, andUrl: imageUrl)
        setupLabelTitle(withLabel: labelTitle, andTitle: title)
        setupLabelAuthor(withLabel: labelAuthor, andAuthors: author)
        setupLabelPublish(withLabel: labelPublish, andPublish: publish)
        setupLabelDate(withLabel: labelDate, andDate: date)
    }
    
    func setupImageCover(withImageView imageView: UIImageView, andUrl url: String) {
        imageView.layer.cornerRadius = 3
        imageView.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        imageView.layer.borderWidth = 0.5
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 2)
        imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "bookPlaceholder"))
    }
    
    func setupLabelTitle(withLabel label: UILabel, andTitle title: String) {
        label.text = title
    }
    
    func setupLabelAuthor(withLabel label: UILabel, andAuthors authors: String) {
        label.text = authors
    }
    
    func setupLabelPublish(withLabel label: UILabel, andPublish publish: String) {
        label.text = publish
    }
    
    func setupLabelDate(withLabel label: UILabel, andDate date: String) {
        label.text = date
    }
}
