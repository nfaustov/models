final class Patient: AccountablePerson, Codable {
    private(set) var id: UUID = UUID()
    var secondName: String = ""
    var firstName: String =  ""
    var patronymicName: String = ""
    var phoneNumber: String = ""
    private(set) var balance: Double = Double.zero
    var passport: PassportData = PassportData()
    var placeOfResidence: PlaceOfResidence = PlaceOfResidence()
    @Relationship(deleteRule: .cascade, inverse: \TreatmentPlan.patient)
    private(set) var treatmentPlans: [TreatmentPlan]?
    var info: String = ""
    private(set) var createdAt: Date = Date.now
    @Attribute(.externalStorage)
    var image: Data?
    @Relationship(inverse: \Payment.patient)
    private(set) var transactions: [Payment]? = []

    var appointments: [PatientAppointment]?
    var asDoctor: Doctor?

    init(
        id: UUID = UUID(),
        secondName: String,
        firstName: String,
        patronymicName: String,
        phoneNumber: String,
        balance: Double = 0,
        passport: PassportData = PassportData(),
        placeOfResidence: PlaceOfResidence = PlaceOfResidence(),
        treatmentPlans: [TreatmentPlan]? = [],
        info: String = "",
        image: Data? = nil,
        transactions: [Payment]? = []
    ) {
        self.id = id
        self.secondName = secondName
        self.firstName = firstName
        self.patronymicName = patronymicName
        self.phoneNumber = phoneNumber
        self.balance = balance
        self.passport = passport
        self.placeOfResidence = placeOfResidence
        self.treatmentPlans = treatmentPlans
        self.info = info
        self.createdAt = .now
        self.image = image
        self.transactions = transactions
    }
}
