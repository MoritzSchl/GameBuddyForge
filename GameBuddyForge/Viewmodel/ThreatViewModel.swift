import FirebaseFirestore
import Foundation

class ThreatViewModel: ObservableObject {
    @Published var threats = [Threat]()
    @Published var error: LocalizedError?
    @Published var isSaving = false
    @Published var didSaveSuccessfully = false
    @Published var editThreat: Threat?
    @Published var isEditSheetPresented = false
    
    private let repository: ThreatRepository
    
    init(repository: ThreatRepository = ThreatRepository()) {
        self.repository = repository
    }
    
    func saveThreat(gametitle: String, title: String, playerCount: Int, description: String, gamerTag: String) {
        Task {
            isSaving = true
            defer { isSaving = false }
            
            do {
                guard let userID = FirebaseAuthManager.shared.userID else {
                    print("User is not authenticated.")
                    return
                }
                
                let threat = Threat(gametitle: gametitle, title: title, playerCount: playerCount, description: description, gamerTag: gamerTag, userID: userID)
                try repository.createThreat(threat)
                didSaveSuccessfully = true
                await fetchThreats()
            } catch let error as LocalizedError {
                self.error = error
            }
        }
    }
    
    
    func deleteThreat(_ threat: Threat) {
        Task {
            do {
                try await repository.deleteThreat(threat)
                await fetchThreats()
            } catch {
                print("Error deleting threat: \(error)")
            }
        }
    }
    
    func editThreat(_ threat: Threat) {
        self.editThreat = threat
        self.isEditSheetPresented = true
    }
    
    func fetchThreats() async {
        do {
            let fetchedThreats = try await repository.fetchThreats()
            DispatchQueue.main.async {
                self.threats = fetchedThreats.sorted { (threat1, threat2) in
                    let isThreat1OwnedByCurrentUser = threat1.isOwnedByCurrentUser
                    let isThreat2OwnedByCurrentUser = threat2.isOwnedByCurrentUser
                    if isThreat1OwnedByCurrentUser && !isThreat2OwnedByCurrentUser {
                        return true
                    } else if !isThreat1OwnedByCurrentUser && isThreat2OwnedByCurrentUser {
                        return false
                    }
                    return false
                }
            }
        } catch {
            print("Error fetching threats: \(error)")
        }
    }
    
    
    func updateThreat(_ threat: Threat) {
        Task {
            do {
                try await repository.updateThreat(threat)
                await fetchThreats()
            } catch {
                print("Error updating threat: \(error)")
            }
        }
    }
}
