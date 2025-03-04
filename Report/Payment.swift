final class Payment {
    private(set) var date: Date = Date.now
    private(set) var purpose: PaymentPurpose?
    private(set) var details: String = ""
    private(set) var methods: [Payment.Method] = [Payment.Method(.cash, value: 0)]
    @Relationship(deleteRule: .cascade, inverse: \Check.payment)
    var receipt: Receipt?
    private(set) var createdBy: AnyUser = AnonymousUser().asAnyUser

    var report: Report?
    var doctor: Doctor?
    var patient: Patient?

    init(
        purpose: PaymentPurpose,
        details: String,
        methods: [Payment.Method],
        receipt: Receipt? = nil,
        createdBy: AnyUser
    ) {
        date = .now
        self.purpose = purpose
        self.details = details
        self.methods = methods
        self.receipt = receipt
        self.createdBy = createdBy
    }
}
