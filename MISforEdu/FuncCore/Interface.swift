import Foundation

protocol editInterface {
    associatedtype returnType
    var ID : String {get set}
    func Push(execution : String) -> update_status
    mutating func Fatch(ID : String) -> returnType
    func Credential() -> Bool
    mutating func SyncWithDatabase() ->
}

protocol queryInterface{
    associatedtype returnType
    var ID : [String] {get set}
    mutating func Fatch(filter : Filter) -> returnType
}

protocol DisplayFormat{
    associatedtype displayType
    var style : style_format {get set}
    func Displayinfo(type : displayType) -> [String : String]
}
struct DisplayList<T> : DisplayList,queryInterface{
    var ID : [String]
    var style : style_format
    func Fatch(filter : Filter) -> T{

    }
    func Displayinfo(type : T) -> [String : String]{
        
    }
}

struct UserInterface<T> : editInterface{
    associatedtype returnType
    var ID : String
    var role : user_role
    var password : String
    var logged : Bool
    var sync : Bool
    func Fatch(ID : String) -> T{
        switch role {
        case .Student do:{
            //
        }
        case .Teacher do:{

        }
        case .Secretary do:{

        }   
        case .Dean do:{

        } 
        case .HR do :{

        }
        }
    }
    func Push(execution : String) -> update_status
    func Credential() -> Bool{

    }
    func SyncWithDatabase() -> Bool{

    }
}