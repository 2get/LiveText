struct CommandError: Error {
    let description: String
    
    init(_ description: String) {
        self.description = description
    }
}
