//
//  BookTableViewCell.swift
//  TableViewApp
//
//  Created by Rassul Turumov on 21.11.2025.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var bookCover: UIImageView!
    
    @IBOutlet weak var bookAuthor: UILabel!
    
    @IBOutlet weak var bookTitle: UILabel!
    
    @IBOutlet weak var bookReview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(book: TableItem) {
        if(book.category != Category.book){
            return
        }
        bookTitle.text = book.title
        bookAuthor.text = book.subtitle
        bookReview.text = book.review
        bookCover.image = book.image
    }

}
