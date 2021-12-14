//
//  TodoDetailsVC.swift
//  Frst_Project_TodoList
//
//  Created by ا on 29/04/1443 AH.
//  Copyright © 1443 sky. All rights reserved.
//

import UIKit
// hello

class TodoDetailsVC: UIViewController {
    var todo: Todo!
    var index: Int!
    
    @IBOutlet weak var todoImageView: UIImageView!
    @IBOutlet weak var todoTitleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if  todo.image != nil {
            todoImageView.image = todo.image
        }else{
            todoImageView.image = UIImage(named: "image-3")
        }
        
       setupUI()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(currentTodoEdited),
                                               name: NSNotification.Name(rawValue: "CurrentTodoEdited"), object: nil)
        
    }
    @objc func currentTodoEdited(notification: Notification){
        if let todo = notification.userInfo? ["editedTodo"] as? Todo{
        self.todo = todo
            setupUI()
        }
    }
    func setupUI(){
        detailsLabel.text = todo.details
        todoTitleLabel.text = todo.title
        todoImageView.image = todo.image
    }
    @IBAction func editTodoButtonClicked(_ sender: Any) {
        if let viewController = storyboard?.instantiateViewController(identifier: "NewTodoVC") as? NewTodoVC {
            viewController.isCreation  = false
            viewController.editedTodo = todo
            viewController.editedTodoIndex = index
            
            navigationController?.pushViewController(viewController, animated: true)
            
        }
    }
    
    @IBAction func deletButtonClicked(_ sender: Any){
        
        let alert = MyAlertViewController(
            title: "تنبيه",
            message: "هل أنت متأكد من إتمام الحذف",
            imageName:"warning_icon")
        
            alert.addAction(title: "نعم", style: .default) { alert in
              NotificationCenter.default.post(name: NSNotification.Name(rawValue: "todoDeleted"), object: nil, userInfo: ["deletedTodoIndex" : self.index ])
            
            let alert = MyAlertViewController(
            title: "تم ",
            message: " تمت عملبةالحذف بنجاح",
            imageName:"warning_icon")
            
            
            alert.addAction(title: "تم", style: .default) { alert in
                self.navigationController?.popViewController(animated: true)
            }
        self.present(alert, animated: true, completion: nil)
            
        }
           alert.addAction(title: "الغاء", style: .cancel)

           present(alert, animated: true, completion: nil)
       
    
            
    /*        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "todoDeleted"), object: nil, userInfo: ["deletedTodoIndex" : self.index ])
            let alert = UIAlertController(title: "تم", message: "تم حذف المهمة بنجاح", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "تم", style: .default) { alert in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        */
        
      //  confirmAlert.addAction(confirmAction)
        
     //   let cancelAction = UIAlertAction(title: "تجاهل", style: //.default, handler: nil)
     //   confirmAlert.addAction(cancelAction)
     // present(confirmAlert, animated: true, completion: nil)
        
      }
  
}
