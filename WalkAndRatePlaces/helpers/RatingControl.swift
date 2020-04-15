//
//  RatingControl.swift
//  WalkAndRatePlaces
//
//  Created by Mac on 14.04.2020.
//  Copyright © 2020 Alexey Barinov. All rights reserved.
//

import UIKit
import Cosmos
@IBDesignable class RatingControl: UIStackView {

    // MARK: Properties
    
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonSelectionState()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setupButtons()
        }
    }
    
    
    @IBInspectable var starCount: Int = 5{
        didSet{
            setupButtons()
        }
    }
    
    
    
    
    //MARK: INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    
    // MARK: actions
    
    @objc func ratingButtonTapped(button: UIButton){
        
        guard let index = ratingButtons.firstIndex(of: button) else {return}
        
        // rate of selected button
        
        let selectedRating = index + 1
        
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    
    // MARK: methods
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // button image
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            // button creation
                  let button = UIButton()
        
            
            // set images
            
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
                  
                  // CONSTRAINTS
                  
                  button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
                  
                  // add button
                  addArrangedSubview(button)
                  
                  
                  // setup button action
                  button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            
            // add new button
            ratingButtons.append(button)
            
            
        }
        updateButtonSelectionState()
      
    }

    private func updateButtonSelectionState() {
        for(index, button) in ratingButtons.enumerated(){
            button.isSelected = index < rating
        }
    }
    
    
}
