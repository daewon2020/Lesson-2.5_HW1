//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // *1. Передать сюда массив с ответами
    // *2. Определить наиболее часто встречающийся тип животного
    // *3. Отобразить результат в соответствии с этим животным
    // *4. Избавиться от кнопки возврата на предыдущий экран
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersResult: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        guard let resultAnimal = getResultAnimal() else {
            animalLabel.text = "Can't find animal"
            descriptionLabel.text = "Can't find description"
            return
        }
        
        animalLabel.text = "Вы - \(resultAnimal.rawValue)"
        descriptionLabel.text = resultAnimal.definition
    }
    
    private func getResultAnimal() -> Animal? {
        var animalCount = [Animal:Int]()
        
        for animal in Animal.allCases{
            animalCount[animal] = answersResult.filter { $0.animal == animal }.count
        }
        
        if let animalResult = animalCount.max(by: {$0.value < $1.value}) {
            return animalResult.key
        }
        
        return nil
    }
}
