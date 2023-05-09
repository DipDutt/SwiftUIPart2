//
//  filemanagerViewModel.swift
//  filemanagerInSwiftUI
//
//  Created by Dip Dutt on 3/5/23.
//

import SwiftUI

// create class localfilemanager.
// create directory to save image to particular directory.
// create path to name of the images.
// show that file is existing.


class LocalFileManager {
    static var shared = LocalFileManager()
    
    func saveImage(image:UIImage,name:String)->String {
        guard let data = image.jpegData(compressionQuality: 1.0),
              let path1 = getPathForImage(name: name) else {
           return "error getting data"
        }
        
        do {
            try data.write(to: path1)
             return "save the image succesfully!"
        }
        catch let error {
             return "Error is \(error)"
        }
    }
        
    func getimage(name:String)-> UIImage? {
            guard let path = getPathForImage(name: name)?.path(),
                  FileManager.default.fileExists(atPath: path) else {
                print("error getting Image")
                return nil
            }
            return UIImage(contentsOfFile: path)
        }
    
    func  deleteImage(name:String)->String {
        guard let path3 = getPathForImage(name: name),
              FileManager.default.fileExists(atPath: path3.path()) else {
            return "error getting path"
        }
        
        do {
            try FileManager.default.removeItem(at:path3 )
             return "successfully deleted"
        } catch let error {
             return " Error deleteing the image: \(error)"
        }
    }
        
    func getPathForImage(name:String)-> URL? {
            guard let path2 = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent("\(name).jpg") else {
                print("Error getting path")
                return nil
            }
            
            return path2
        }
}


class filemanagerViewModel:ObservableObject {
    @Published var image:UIImage? = nil
    let imagename:String = "Shiva.cloudy-morning"
    let manager = LocalFileManager.shared
    @Published var infomessage:String = ""
    
    init() {
       //getimageFromAssest()
        getImageFromFileManager()
    }
    
    func getimageFromAssest() {
        image = UIImage(named:imagename )
        
    }
    
    func saveImage() {
        guard let image = image else { return}
       infomessage = manager.saveImage(image: image, name: imagename)
    }
    
    func getImageFromFileManager() {
        image = manager.getimage(name: imagename)
    }
    
    func deleteImageFromFileManager() {
        infomessage = manager.deleteImage(name: imagename)
    }
}
