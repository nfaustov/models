final class Doctor: Accountable, User, Codable {
    private(set) var id: UUID = UUID()
    var secondName: String = ""
    var firstName: String = ""
    var patronymicName: String = ""
    var phoneNumber: String = ""
    var birthDate: Date = Date(timeIntervalSinceReferenceDate: 0)
    var department: Department = Department.gynecology
    @Relationship(inverse: \PricelistItem.doctors)
    var defaultPricelistItem: PricelistItem? = nil
    var serviceDuration: TimeInterval = 600
    var defaultCabinet: Int = 1
    var doctorSalary: Salary = Salary.pieceRate(rate: 0.4)
    private(set) var balance: Double = 0
    var info: String = ""
    private(set) var createdAt: Date = Date.now
    @Attribute(.externalStorage)
    var image: Data?
    var accessLevel: UserAccessLevel = UserAccessLevel.doctor
    var vacationSchedule: [DateInterval] = []
    @Relationship(inverse: \Payment.doctor)
    private(set) var transactions: [Payment]? = []
    @Relationship(deleteRule: .cascade, inverse: \Patient.asDoctor)
    var asPatient: Patient?
    
    var schedules: [DoctorSchedule]?
    var performedServices: [MedicalService]?
    var appointedServices: [MedicalService]?
    
    init(
        id: UUID = UUID(),
        secondName: String,
        firstName: String,
        patronymicName: String,
        phoneNumber: String,
        birthDate: Date,
        department: Department,
        defaultPricelistItem: PricelistItem? = nil,
        serviceDuration: TimeInterval,
        defaultCabinet: Int,
        doctorSalary: Salary,
        balance: Double = 0,
        info: String = "",
        image: Data? = nil,
        accessLevel: UserAccessLevel = .doctor,
        vacationSchedule: [DateInterval] = [],
        transactions: [Payment]? = [],
        achievements: [Achievement] = []
    ) {
        self.id = id
        self.secondName = secondName
        self.firstName = firstName
        self.patronymicName = patronymicName
        self.phoneNumber = phoneNumber
        self.birthDate = birthDate
        self.department = department
        self.defaultPricelistItem = defaultPricelistItem
        self.serviceDuration = serviceDuration
        self.defaultCabinet = defaultCabinet
        self.doctorSalary = doctorSalary
        self.balance = balance
        self.info = info
        self.createdAt = .now
        self.image = image
        self.accessLevel = accessLevel
        self.vacationSchedule = vacationSchedule
        self.transactions = transactions
        self.achievements = achievements
    }
}
