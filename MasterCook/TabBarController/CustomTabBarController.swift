import UIKit

class TabBarController: UITabBarController {
    
    var centerWidth: CGFloat { tabBar.bounds.width / 2 }
    var circleRadius: CGFloat = 26
    var shapeLayer: CALayer?
    var circleLayer: CALayer?
    let item = UITabBarItem()
    
    let middleButton = UIButton()
    let buttonImage = UIImageView()
    let middleButtonDiameter: CGFloat = 48
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMiddleButton()
        setConstraints()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let vc1 = UIViewController()
        let vc2 = UIViewController()
        let vcMiddle = HomeViewController()
        let vc3 = UIViewController()
        let vc4 = UIViewController()
        
        viewControllers = [
            generateNavigationController(rootViewController: vc1, title: "", image: UIImage(systemName: "house")),
            generateNavigationController(rootViewController: vc2, title: "", image: UIImage(systemName: "list.clipboard")),
            generateNavigationController(rootViewController: vcMiddle, title: "", image: UIImage(systemName: "")),
            generateNavigationController(rootViewController: vc3, title: "", image: UIImage(systemName: "clock.arrow.circlepath")),
            generateNavigationController(rootViewController: vc4, title: "", image: UIImage(systemName: "person.crop.circle"))
        ]
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        } else {
            tabBar.barTintColor = .clear
        }
        tabBar.tintColor = .redButtonColor()
        UITabBar.appearance().barTintColor = .white
    }
    
    // MARK: - Setup Navigation Controller & Navigation BAr
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        return navigationVC
    }
    
    // MARK: - Middle button
    
    func setupMiddleButton() {
        
        middleButton.layer.cornerRadius = middleButtonDiameter/2
        middleButton.backgroundColor = .redButtonColor()
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        
        buttonImage.image = UIImage(systemName: "plus")
        buttonImage.contentMode = .scaleAspectFill
        buttonImage.tintColor = .black
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        
        middleButton.addTarget(self, action: #selector(didPressMiddleButton(sender:)), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func didPressMiddleButton(sender: UIButton) {
        selectedIndex = 2
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        
        if let oldShapeLayer = self.shapeLayer {
            tabBar.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            tabBar.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    func shapePath() -> CGPath {
        let height: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth = tabBar.frame.width / 2
        
        path.move (to: CGPoint(x: 0, y: 0)) // start top left
        path.addLine (to: CGPoint(x: (centerWidth - height * 2), y: 0)) // the beginning of the trough
        
        // first curve down
        path.addCurve(to: CGPoint(x: centerWidth, y: height) ,
                      controlPoint1: CGPoint(x: (centerWidth - 30), y: 0),
                      controlPoint2: CGPoint(x: centerWidth - 35, y: height))
        // second curve up
        path.addCurve(to: CGPoint(x: (centerWidth + height * 2) , y: 0),
                      controlPoint1: CGPoint (x: centerWidth + 35, y: height),
                      controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))
        // complete the rect
        path.addLine (to: CGPoint (x: tabBar.frame.width, y: 0))
        path.addLine (to: CGPoint (x: tabBar.frame.width, y: tabBar.frame.height))
        path.addLine (to: CGPoint(x: 0, y: tabBar.frame.height))
        path.close()
        
        return path.cgPath
    }
    
    // MARK: - Set constraints
    
    func setConstraints() {
        
        middleButton.addSubview(buttonImage)
        
        NSLayoutConstraint.activate([
            buttonImage.heightAnchor.constraint(equalToConstant: 15),
            buttonImage.widthAnchor.constraint(equalToConstant: 18),
            buttonImage.centerXAnchor.constraint(equalTo: middleButton.centerXAnchor),
            buttonImage.centerYAnchor.constraint(equalTo: middleButton.centerYAnchor)
        ])
        
        tabBar.addSubview(middleButton)
        
        NSLayoutConstraint.activate([
            middleButton.heightAnchor.constraint(equalToConstant: middleButtonDiameter),
            middleButton.widthAnchor.constraint(equalToConstant: middleButtonDiameter),
            middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            middleButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -20)
        ])
        
    }
}

// MARK: - SwiftUI Canvas

import SwiftUI
struct TabBarProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        
        let tabBarController = TabBarController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<TabBarProvider.ContainterView>) -> TabBarController {
            return tabBarController
        }
        
        func updateUIViewController(_ uiViewController: TabBarProvider.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<TabBarProvider.ContainterView>) {
        }
    }
}


