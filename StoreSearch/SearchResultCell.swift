//
//  SearchResultCell.swift
//  StoreSearch
//
//  Created by Daniel Janes on 1/15/21.
//

import UIKit

class SearchResultCell: UITableViewCell {
    
    // MARK: - Properties
    var downloadTask: URLSessionDownloadTask?
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    
    
    
    // MARK: - View Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(named: "SearchBar")?.withAlphaComponent(0.5)
        selectedBackgroundView = selectedView
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        downloadTask?.cancel()
        downloadTask = nil
        
        print("PrepareForReuse() is running")
    }
    
    // MARK: - Helper Methods
    func configure(for result: SearchResult) {
        nameLabel.text = result.name

        if result.artist.isEmpty {
          artistNameLabel.text = "Unknown"
        } else {
          artistNameLabel.text = String(format: "%@ (%@)", result.artist, result.type)
        }
        
        artworkImageView.image = UIImage(systemName: "square")
        if let smallURL = URL(string: result.imageSmall) {
          downloadTask = artworkImageView.loadImage(url: smallURL)
      }
    }

}
