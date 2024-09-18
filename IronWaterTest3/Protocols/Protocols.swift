import Foundation

protocol ProfileVCDelegate: AnyObject {
    func didUpdateProf(_ update: [ProfileField])
}
