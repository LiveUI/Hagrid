//
//  ViewController.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import UIKit
import TheGrid
import Modular


class ViewController: GridViewController {

    // MARK: Example app
    
    let albumCover = UIImageView()

    let albumTitleLabel = UILabel()
    let artistLabel = UILabel()
    let yearLabel = UILabel()

    /// Create album cover
    func configureAlbumCover() {
        albumCover.backgroundColor = .random
        albumCover.image = UIImage(named: "TestData/AlbumCover")
        albumCover.contentMode = .scaleAspectFill
        albumCover.clipsToBounds = true
        albumCover.layer.cornerRadius = 3
        
        gridView.add(subview: albumCover, from: 0, space: 5) { make in
            make.height.equalTo(self.albumCover.snp.width)
        }
    }

    /// Create album labels
    func createAlbumLabels() {
        albumTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        albumTitleLabel.text = "Ten"
        albumTitleLabel.textColor = .darkText
        gridView.add(subview: albumTitleLabel, from: 5, space: Position.last, padding: .left(12))
        
        artistLabel.font = UIFont.systemFont(ofSize: 15)
        artistLabel.text = "Pearl Jam"
        artistLabel.textColor = .gray
        gridView.add(subview: artistLabel, .below(albumTitleLabel, offset: 2), from: 5, space: Position.last, padding: .left(12))
        
        yearLabel.font = UIFont.systemFont(ofSize: 12)
        yearLabel.text = "Released: 1991"
        yearLabel.textColor = .gray
        gridView.add(subview: yearLabel, .below(artistLabel, offset: 2), from: 5, space: Position.last, padding: .left(12))
    }

    /// Add all subviews on the canvas
    func addSubviews() {
        configureAlbumCover()
        createAlbumLabels()
    }
    
    // MARK: Other interface
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupGridView()
        
        navigationController?.navigationBar.isTranslucent = false
        gridView.backgroundColor = .white
    }
    
    func setupNavBar() {
        title = "HaGrid"
        
        let columns = UISegmentedControl(items: ["12", "8", "22"])
        columns.addTarget(self, action: #selector(selectColumns(_:)), for: .valueChanged)
        columns.selectedSegmentIndex = 0
        let columnsItem = UIBarButtonItem(customView: columns)
        navigationItem.leftBarButtonItem = columnsItem
        
        let toggle = UIBarButtonItem(title: "Debug", style: .plain, target: self, action: #selector(toggleGrid))
        navigationItem.rightBarButtonItem = toggle
    }
    
    func setupGridView() {
        toggleGrid()
        
        gridView.config.padding = .full(top: 6, left: 12, right: 12)
        
        addSubviews()
    }
    
    // MARK: Actions
    
    @objc func selectColumns(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .beginFromCurrentState, animations: {
            if sender.selectedSegmentIndex == 0 {
                self.gridView.config.numberOfColumns = 12
            } else if sender.selectedSegmentIndex == 1 {
                self.gridView.config.numberOfColumns = 8
            } else {
                self.gridView.config.numberOfColumns = 22
            }
        })
    }
    
    @objc func toggleGrid() {
        gridView.config.displayGrid = !gridView.config.displayGrid
        
        let debugColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        albumTitleLabel.backgroundColor = gridView.config.displayGrid ? debugColor : .clear
        artistLabel.backgroundColor = gridView.config.displayGrid ? debugColor : .clear
        yearLabel.backgroundColor = gridView.config.displayGrid ? debugColor : .clear
    }

}
