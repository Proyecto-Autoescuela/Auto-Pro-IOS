//
//  Network.swift
//  AutoPro-iOS
//
//  Created by alumnos on 24/02/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import Foundation
import Alamofire

class Network{
    static var id:Int = 1
    
    
    class func GetLessons (completed: @escaping () -> ()) {
        let url = URL(string: "http://localhost:8888/autopro/AutoPro-API-features-migrations/public/api/unit")
        
        let json = ["api_token": "24"]
        
        Alamofire.request(url!, method: .get, parameters: json, headers: nil).responseJSON { (response) in
            print(response)
            
            do {
                themes = try JSONDecoder().decode([Temario].self, from: response.data!)
                DispatchQueue.main.async{
                    completed()
                }
                
            }catch {
                print(error)
                
            }
            }.resume()
    }
    
    // Login
    class func getUser(email: String, password: String, sender: Any, completion: @escaping (Bool, Bool) -> ()){
            let url = URL(string: "http://localhost:8888/autopro/AutoPro-API-features-migrations/public/api/loginApp")
            let json = ["email": email,
                        "password": password,
                        "api_token": "24"]
            
            Alamofire.request(url!, method: .get, parameters: json, headers: nil).responseJSON { (response) in
                print(response)
                
                do {
                    
                    let rs: PostUserResponse = try JSONDecoder().decode(PostUserResponse.self, from: response.data!)
                    print(rs.error_msg!)
                    
                    if rs.error_code == 200 {
                        
                        if rs.error_msg == "Profesor" {
                            let id = rs.id!
                           let id_user_string = String(id)
                           
                           let name = rs.name!
                           let email = rs.email!
                           
                           let number_of_students = rs.number_of_students!
                           let number_of_students_string = String(number_of_students)
                           
                           //guardo en un array de string la informacion del profesor
                           let teacherInfo : [String] = [id_user_string, name, email, number_of_students_string]
                           
                          //guardo el Array de forma persistente
                           UserDefaults.standard.set(teacherInfo, forKey: "Teacherinfo")
                            completion(true,false)
                        }else if rs.error_msg == "Alumno"{
                            id = rs.id!
                            let id_user_string = String(id)
                            
                            let name = rs.name!
                            let email = rs.email!
                            let license = rs.license!
                            
                            let StudentInfo : [String] = [id_user_string, name, email, license]
                            
                            print(StudentInfo)
                            print("2")
                            
                            //guardo el Array de forma persistente
                            UserDefaults.standard.set(StudentInfo, forKey: "Studentinfo")
                            
                            completion(true, true)
                            
                        }
                        
                    }else if rs.error_code == 404 {
                        completion(false, false)
                        errorBool = true
                    }
                    
                }catch {
                    print(error)
                    errorBool = false
                }
                
            
        }
    }
    
    
    // Examenes
    
    class func getTest(completed: @escaping () -> ()){
        
        let url = URL(string: "http://localhost:8888/autopro/AutoPro-API-features-migrations/public/api/prueba")
        let json = ["unit_id": unitIdTest]
        
        Alamofire.request(url!, method: .get, parameters: json, headers: nil).responseJSON { (response) in
            print(response)
           
            do {
                questions = try JSONDecoder().decode([Question].self, from: response.data!)
                DispatchQueue.main.async{
                    
                    print(questions)
                    completed()
                }
                
            }catch {
                print(error)
                
            }
            }.resume()
        
    }
    
      
        
    
    class func postTest(){
        
        let strid = String(id)
        let stridt = String(unitIdTest)
        let stra = String(aciertos)
        let url = URL(string: "http://localhost:8888/autopro/AutoPro-API-features-migrations/public/api/prueba/add/\(strid)/\(stridt)/\(stra)")
        let json: Parameters =  ["unit_id": unitIdTest, "calification": aciertos, "student_id": id]
        print(url!)
        Alamofire.request(url!, method: .post, parameters: json).responseJSON { (response) in
        print(response)
            
            do {
                DispatchQueue.main.async{
                    
                }
                
            }catch {
                print(error)
                
            }
            }.resume()
    }
    
}
