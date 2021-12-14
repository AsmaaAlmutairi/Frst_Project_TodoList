//
//  TodoStorage.swift
//  Frst_Project_TodoList
//
//  Created by ا on 09/05/1443 AH.
//  Copyright © 1443 sky. All rights reserved.
//

import CoreData
import UIKit

class TodoStorage {
    static func storeTodo(todo: Todo){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let  managedContext = appDelegate.persistentContainer.viewContext
        guard let todoEntity = NSEntityDescription.entity(forEntityName: "Todos", in: managedContext) else { return }
        let todoObject = NSManagedObject.init(entity: todoEntity, insertInto: managedContext)
        todoObject.setValue(todo.title, forKey: "title")
        todoObject.setValue(todo.details, forKey: "details")
        
        if let image = todo.image {
            let imageData = image.jpegData(compressionQuality: 1)
            todoObject.setValue(imageData, forKey: "image")
        }
        do{
           try managedContext.save()
            print("========= success ========")
        }catch{
            print("=========error=========")
        }
        
    }
    

    static func updateTodo(todo: Todo, index: Int) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
    { return }
    let context = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todos")
      do {
              let result = try context.fetch(fetchRequest) as! [NSManagedObject]
        
        result[index].setValue(todo.title, forKey: "title")
        result[index].setValue(todo.details, forKey: "details")
        if let image = todo.image {
            let imageData = image.jpegData(compressionQuality: 1)
            result[index].setValue(imageData, forKey: "image")
        }
        
        
           try context.save()
        
        
      }catch {
              print("=========Error=========")
    }
}
     static func deleteTodo(index: Int) {
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
           { return }
           let context = appDelegate.persistentContainer.viewContext
           
           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todos")
             do {
                     let result = try context.fetch(fetchRequest) as! [NSManagedObject]
               let todoToDelete = result[index]
               context.delete(todoToDelete)
               
                  try context.save()
               
               
             }catch {
                     print("=========Error=========")
           }
       }
    static func getTodos() -> [Todo]{
            var todos: [Todo] = []
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return
                []}
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todos")
            do {
                let result = try context.fetch(fetchRequest) as! [NSManagedObject]
                for managedTodo in result {
                    print(managedTodo)
                    let title = managedTodo.value(forKeyPath: "title") as? String
                    let details = managedTodo.value(forKey: "details") as? String
                    
                    var todoImage: UIImage? = nil
                    if let imageFromContext = managedTodo.value(forKey: "image") as? Data {
                        todoImage = UIImage(data: imageFromContext)
                    }
                    let todo = Todo(title: title ?? "", image: todoImage, details: details ?? "")
                    todos.append(todo)
                }
            }catch {
                print("=========Error=========")
            }
            return todos
        }
        
    }

