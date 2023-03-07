//

//

import UIKit

extension ViewController {
    
    // Создание фона
    func backgroundView() {
        let imageView = UIImageView(image: UIImage(named: "background.jpg"))
        imageView.frame = view.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
    }
    
    // Добавление затемнения
    func blackoutView() {
        let imageView = UIImageView(image: UIImage(named: "Effect.png"))
        imageView.frame = view.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
    }
    
    // Добавление лейбла "cook #WithMe"
    func titleLabe() {
        let label = UILabel()
        label.text = "cook\n#WithMe"
        label.font = UIFont.systemFont(ofSize: 56, weight: .bold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.frame = CGRect(x: (view.frame.size.width - 320) / 2, y: view.frame.size.height - 134 - 207, width: 320, height: 134)
        view.addSubview(label)
    }
    
    // Добавление лейбла "Find best recipes for cooking"
    func subtitleLabel() {
        let label = UILabel()
        label.text = "Find best recipes for cooking"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.frame = CGRect(x: (view.frame.size.width - 231) / 2, y: view.frame.size.height - 22 - 170, width: 231, height: 22)
        view.addSubview(label)
    }
    
    // Добавление кнопки
    func addButton() {
        let button = UIButton(type: .custom)
        let buttonImage = UIImage(named: "Primary.png")
        button.setImage(buttonImage, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: buttonImage?.size.width ?? 0, height: buttonImage?.size.height ?? 0)
        button.center = CGPoint(x: view.bounds.midX, y: view.bounds.maxY - 82)
        view.addSubview(button)
    }
    
    // Добавление изображения звездочки
    func starView() {
        let imageView = UIImageView(image: UIImage(named: "Star.png"))
        imageView.frame = CGRect(x: 86, y: 65.2, width: 12, height: 12)
        view.addSubview(imageView)
    }
    
    //Добавляем лейбл "100+"
    func countLabel() {
        let textLabel = UILabel()
        textLabel.frame = CGRect(x: 107, y: 60, width: 49, height: 22)
        textLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        textLabel.textColor = UIColor.white
        textLabel.textAlignment = .left
        textLabel.text = "100k+"
        view.addSubview(textLabel)
    }
    //Добавляем лейбл "Premium recipes"
    func premiumLabel() {
        let textLabel = UILabel()
        textLabel.frame = CGRect(x: 155, y: 60, width: 138, height: 22)
        textLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textLabel.textColor = UIColor.white
        textLabel.textAlignment = .left
        textLabel.text = "Premium recipes"
        view.addSubview(textLabel)
    }
    
}
