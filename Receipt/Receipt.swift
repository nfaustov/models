final class Receipt {
    @Relationship(deleteRule: .cascade, inverse: \MedicalService.receipt)
    private var _services: [MedicalService]?
    var discount: Double = 0

    var appointments: [PatientAppointment]?
    var payment: Payment?

    var services: [MedicalService] {
        get {
            _services ?? []
        }
        set {
            _services = newValue

            if newValue.isEmpty {
                discount = 0
                promotion = nil
            }
        }
    }

    init(
        services: [MedicalService]? = [],
        discount: Double = 0,
        refund: Refund? = nil,
        promotion: Promotion? = nil
    ) {
        self._services = services
        self.discount = discount
        self.refund = refund
        self.promotion = promotion
    }
}
