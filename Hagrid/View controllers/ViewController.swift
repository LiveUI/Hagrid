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


class ViewController: GridScrollViewController {

    // MARK: Example app
    
    let albumCover = UIImageView()

    let albumTitleLabel = UILabel()
    let artistLabel = UILabel()
    let yearLabel = UILabel()
    let purchaseButton = UIButton()
    let ratingLabel = UILabel()
    
    let separator = UIView()
    
    let aboutLabel = UILabel()
    
    /// Setup layout for all elements
    func setupLayout() {
        // Add an album cover
        gridView.add(subview: albumCover, space: 5) { make in
            make.height.equalTo(self.albumCover.snp.width)
        }
        
        let albumCoverRelation: Position = .relation(albumCover)
        
        gridView.add(subview: albumTitleLabel, from: albumCoverRelation, space: .last, padding: .left(12))
        
        let subtitlesLast: Position = .custom { _ in
            return self.gridView.bounds.size.width < 414 ? .last : .reversed(2)
        }
        
        gridView.add(subview: artistLabel, .below(albumTitleLabel, margin: 2), from: albumCoverRelation, space: subtitlesLast, padding: .horizontal(left: 12, right: 0))
        
        gridView.add(subview: yearLabel, .below(artistLabel, margin: 2), from: albumCoverRelation, space: subtitlesLast, padding: .horizontal(left: 12, right: 0))
        
        gridView.add(subview: purchaseButton, .custom({ _ in
            if self.gridView.bounds.size.width < 414 {
                return .below(self.yearLabel, margin: 3)
            } else {
                return .match(self.artistLabel)
            }
        }), from: .custom({ _ in
            if self.gridView.bounds.size.width < 414 {
                return .relation(self.albumCover, margin: 12)
            } else {
                return .relation(self.artistLabel, margin: 6)
            }
        }), space: .last) { make in
            make.height.equalTo(28)
        }
        
        gridView.add(subview: ratingLabel, .above(separator, margin: 12), from: .dynamic, space: .last) { make in
            make.height.equalTo(28)
        }
        
        gridView.add(subview: separator, .below([albumCover, yearLabel, purchaseButton], margin: 12)) { make in
            make.height.equalTo(1)
        }
        
        gridView.add(subview: aboutLabel, .below(separator, margin: 12))
    }

    /// Create album cover
    func configureAlbumCover() {
        albumCover.backgroundColor = .random
        albumCover.image = UIImage(named: "TestData/AlbumCover")
        albumCover.contentMode = .scaleAspectFill
        albumCover.clipsToBounds = true
        albumCover.layer.cornerRadius = 3
    }

    /// Create album labels
    func configureAlbumLabels() {
        albumTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        albumTitleLabel.text = "Ten"
        albumTitleLabel.textColor = .darkText
        
        artistLabel.font = UIFont.systemFont(ofSize: 15)
        artistLabel.text = "Pearl Jam"
        artistLabel.textColor = .gray

        yearLabel.font = UIFont.systemFont(ofSize: 12)
        yearLabel.text = "Released: 1991"
        yearLabel.textColor = .gray
        
        ratingLabel.font = UIFont.boldSystemFont(ofSize: 34)
        ratingLabel.text = "* * * * *"
        ratingLabel.textColor = .orange
        
        separator.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        aboutLabel.font = UIFont.systemFont(ofSize: 12)
        aboutLabel.numberOfLines = 0
        aboutLabel.text = """
        Ten is the debut studio album by American rock band Pearl Jam, released on August 27, 1991 through Epic Records. Following the disbanding of bassist Jeff Ament and guitarist Stone Gossard's previous group Mother Love Bone, the two recruited vocalist Eddie Vedder, guitarist Mike McCready, and drummer Dave Krusen to form Pearl Jam in 1990. Most of the songs began as instrumental jams, to which Vedder added lyrics about topics such as depression, homelessness, and abuse.
        
        Ten was not an immediate success, but by late 1992 it had reached number two on the Billboard 200 chart. The album produced three hit singles: "Alive", "Even Flow", and "Jeremy". While Pearl Jam was accused of jumping on the grunge bandwagon at the time—despite the fact that Ten had been both recorded and released before Nirvana's Nevermind — Ten was instrumental in popularizing alternative rock in the mainstream. In February 2013, the album crossed the 10 million mark in sales, becoming the 22nd one to do so in the Nielsen SoundScan era and has been certified 13× platinum by the RIAA. It remains Pearl Jam's most commercially successful album.
        
        Pearl Jam:
        Pearl Jam is an American rock band formed in Seattle, Washington, in 1990. Since its inception, the band's line-up has consisted of Eddie Vedder (lead vocals), Mike McCready (lead guitar), Stone Gossard (rhythm guitar) and Jeff Ament (bass). The band's fifth member is drummer Matt Cameron (also of Soundgarden), who has been with the band since 1998. Boom Gaspar (piano) has also been a session/touring member with the band since 2002. Drummers Dave Krusen, Matt Chamberlain, Dave Abbruzzese and Jack Irons are former members of the band.
        
        Formed after the demise of Gossard and Ament's previous band, Mother Love Bone, Pearl Jam broke into the mainstream with its debut album, Ten, in 1991. One of the key bands in the grunge movement of the early 1990s, over the course of the band's career, its members became noted for their refusal to adhere to traditional music industry practices, including refusing to make proper music videos or give interviews, and engaging in a much-publicized boycott of Ticketmaster. In 2006, Rolling Stone described the band as having "spent much of the past decade deliberately tearing apart their own fame."[1]
        
        To date, the band has sold nearly 32 million records in the United States[2] and an estimated 60 million worldwide.[3][4] Pearl Jam has outlasted and outsold many of its contemporaries from the alternative rock breakthrough of the early 1990s, and is considered one of the most influential bands of that decade.[5] Stephen Thomas Erlewine of AllMusic referred to Pearl Jam as "the most popular American rock & roll band of the '90s".[6] Pearl Jam was inducted into the Rock and Roll Hall of Fame on April 7, 2017, in its first year of eligibility.
        """
        aboutLabel.textColor = .darkText
    }
    
    /// Configure purchase button
    func configurePurchaseButton() {
        purchaseButton.layer.borderWidth = 1
        purchaseButton.layer.borderColor = purchaseButton.tintColor.cgColor
        purchaseButton.layer.cornerRadius = 4
        purchaseButton.setTitle("Buy £", for: .normal)
        purchaseButton.setTitleColor(purchaseButton.tintColor, for: .normal)
        purchaseButton.setTitleColor(.lightGray, for: .highlighted)
        purchaseButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
    }

    /// Add all subviews on the canvas
    func addSubviews() {
        configureAlbumCover()
        configureAlbumLabels()
        configurePurchaseButton()
        
        setupLayout()
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
        
        let columns = UISegmentedControl(items: ["12", "15", "18"])
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
                self.gridView.config.numberOfColumns = 15
            } else {
                self.gridView.config.numberOfColumns = 18
            }
        })
    }
    
    @objc func toggleGrid() {
        gridView.config.displayGrid = !gridView.config.displayGrid
        
        let debugColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        albumTitleLabel.backgroundColor = gridView.config.displayGrid ? debugColor : .clear
        artistLabel.backgroundColor = gridView.config.displayGrid ? debugColor : .clear
        yearLabel.backgroundColor = gridView.config.displayGrid ? debugColor : .clear
        ratingLabel.backgroundColor = gridView.config.displayGrid ? debugColor : .clear
    }

}
