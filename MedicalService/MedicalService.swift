final class MedicalService {
    private(set) var pricelistItem: PricelistItem.Snapshot
    private(set) var treatmentPlanPrice: Double?
    var quantity: Int = 1
    @Relationship(inverse: \Doctor.performedServices)
    var performer: Doctor?
    @Relationship(inverse: \Doctor.appointedServices)
    var agent: Doctor?
    @Attribute(.externalStorage)
    private(set) var conclusion: Data?

    var receipt: Receipt?
    var refund: Refund?
    var checkTemplates: [CheckTemplate]?

    var date: Date? {
        check?.payment?.date
    }

    init(
        pricelistItem: PricelistItem.Snapshot,
        treatmentPlanPrice: Double? = nil,
        quantity: Int = 1,
        performer: Doctor? = nil,
        agent: Doctor? = nil,
        conclusion: Data? = nil
    ) {
        self.pricelistItem = pricelistItem
        self.treatmentPlanPrice = treatmentPlanPrice
        self.quantity = quantity
        self.performer = performer
        self.agent = agent
        self.conclusion = conclusion
    }
}
