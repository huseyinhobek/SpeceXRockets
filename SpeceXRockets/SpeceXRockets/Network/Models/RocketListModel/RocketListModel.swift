//
//  RocketListModel.swift
//  SpeceXRockets
//
//  Created by Hüseyin HÖBEK on 30.09.2022.
//


import Foundation
import Kingfisher
import UIKit

struct RocketResponse: Decodable {
    
    let height, diameter: Diameter?
    let mass: Mass?
    let firstStage: FirstStage?
    let secondStage: SecondStage?
    let engines: Engines?
    let landingLegs: LandingLegs?
    let payloadWeights: [PayloadWeight]?
    let flickrImages: [String]?
    let name: String?
    let type: String?
    let active: Bool?
    let stages, boosters, costPerLaunch, successRatePct: Int?
    let firstFlight, country, company: String?
    let wikipedia: String?
    let welcomeDescription, id: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.height = try container.decodeIfPresent(Diameter.self, forKey: .height)
        self.diameter = try container.decodeIfPresent(Diameter.self, forKey: .diameter)
        self.mass = try container.decodeIfPresent(Mass.self, forKey: .mass)
        self.firstStage = try container.decodeIfPresent(FirstStage.self, forKey: .firstStage)
        self.secondStage = try container.decodeIfPresent(SecondStage.self, forKey: .secondStage)
        self.engines = try container.decodeIfPresent(Engines.self, forKey: .engines)
        self.landingLegs = try container.decodeIfPresent(LandingLegs.self, forKey: .landingLegs)
        self.payloadWeights = try container.decodeIfPresent([PayloadWeight].self, forKey: .payloadWeights)
        self.flickrImages = try container.decodeIfPresent([String].self, forKey: .flickrImages)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active)
        self.stages = try container.decodeIfPresent(Int.self, forKey: .stages)
        self.boosters = try container.decodeIfPresent(Int.self, forKey: .boosters)
        self.costPerLaunch = try container.decodeIfPresent(Int.self, forKey: .costPerLaunch)
        self.successRatePct = try container.decodeIfPresent(Int.self, forKey: .successRatePct)
        self.firstFlight = try container.decodeIfPresent(String.self, forKey: .firstFlight)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.company = try container.decodeIfPresent(String.self, forKey: .company)
        self.wikipedia = try container.decodeIfPresent(String.self, forKey: .wikipedia)
        self.welcomeDescription = try container.decodeIfPresent(String.self, forKey: .welcomeDescription)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    enum CodingKeys: String, CodingKey {
        case height, diameter, mass
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case landingLegs = "landing_legs"
        case payloadWeights = "payload_weights"
        case flickrImages = "flickr_images"
        case name, type, active, stages, boosters
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country, company, wikipedia
        case welcomeDescription = "description"
        case id
    }
}
// MARK: - Diameter
struct Diameter: Codable {
    let meters, feet: Double?
}

// MARK: - Engines
struct Engines: Decodable {
    let isp: ISP?
    let thrustSeaLevel, thrustVacuum: Thrust?
    let number: Int?
    let type, version, layout: String?
    let engineLossMax: Int?
    let propellant1, propellant2: String?
    let thrustToWeight: Double?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isp = try container.decodeIfPresent(ISP.self, forKey: .isp)
        self.thrustSeaLevel = try container.decodeIfPresent(Thrust.self, forKey: .thrustSeaLevel)
        self.thrustVacuum = try container.decodeIfPresent(Thrust.self, forKey: .thrustVacuum)
        self.number = try container.decodeIfPresent(Int.self, forKey: .number)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
        self.layout = try container.decodeIfPresent(String.self, forKey: .layout)
        self.engineLossMax = try container.decodeIfPresent(Int.self, forKey: .engineLossMax)
        self.propellant1 = try container.decodeIfPresent(String.self, forKey: .propellant1)
        self.propellant2 = try container.decodeIfPresent(String.self, forKey: .propellant2)
        self.thrustToWeight = try container.decodeIfPresent(Double.self, forKey: .thrustToWeight)
    }

    enum CodingKeys: String, CodingKey {
        case isp
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case number, type, version, layout
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }
}
// MARK: - ISP
struct ISP: Codable {
    let seaLevel, vacuum: Int?

    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
}

// MARK: - Thrust
struct Thrust: Codable {
    let kN, lbf: Int?
}

// MARK: - FirstStage
struct FirstStage: Decodable {
    let thrustSeaLevel, thrustVacuum: Thrust?
    let reusable: Bool?
    let engines: Int?
    let fuelAmountTons: Double?
    let burnTimeSEC: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.thrustSeaLevel = try container.decodeIfPresent(Thrust.self, forKey: .thrustSeaLevel)
        self.thrustVacuum = try container.decodeIfPresent(Thrust.self, forKey: .thrustVacuum)
        self.reusable = try container.decodeIfPresent(Bool.self, forKey: .reusable)
        self.engines = try container.decodeIfPresent(Int.self, forKey: .engines)
        self.fuelAmountTons = try container.decodeIfPresent(Double.self, forKey: .fuelAmountTons)
        self.burnTimeSEC = try container.decodeIfPresent(Int.self, forKey: .burnTimeSEC)
    }

    enum CodingKeys: String, CodingKey {
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - LandingLegs
struct LandingLegs: Decodable {
    let number: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        number = try container.decode(Int.self, forKey: .number)
    }
    
    private enum CodingKeys: String, CodingKey {
        case number
    }
}

// MARK: - Mass
struct Mass: Codable {
    let kg, lb: Int?
}

// MARK: - PayloadWeight
struct PayloadWeight: Codable {
    let id, name: String?
    let kg, lb: Int?
}

// MARK: - SecondStage
struct SecondStage: Codable {
    let thrust: Thrust?
    let payloads: Payloads?
    let reusable: Bool?
    let engines: Int?
    let fuelAmountTons: Double?
    let burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case thrust, payloads, reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - Payloads
struct Payloads: Codable {
    let compositeFairing: CompositeFairing?
    let option1: String?

    enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option1 = "option_1"
    }
}
// MARK: - CompositeFairing
struct CompositeFairing: Codable {
    let height, diameter: Diameter
}

// MARK: - Encode/decode helpers

class JSONNull: Codable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


