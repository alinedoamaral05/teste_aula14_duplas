enum UFData {
    case RO
    case AC
    case AM
    case RR
    case PA
    case AP
    case TO
    case MA
    case PI
    case CE
    case RN
    case PB
    case PE
    case AL
    case SE
    case BA
    case MG
    case ES
    case RJ
    case SP
    case PR
    case SC
    case RS
    case MS
    case MT
    case GO
    case DF
}

class Address {
    var street: String
    var number: Int
    var addressComplement: String?
    var district: String
    var city: String
    var uf: UFData
    var description: String {
        return String("\(street), \(number), \(addressComplement) - \(district) - \(city) - \(uf)")
    }
    
    init(street: String, number: Int, addressComplement: String?, district: String, city: String, uf: UFData, description: String) {
        self.street = street
        self.number = number
        self.addressComplement = addressComplement
        self.district = district
        self.city = city
        self.uf = uf
    }
    
}

enum EmailType{
    case professional
    case personal
}

class Email {
    var emailAddress: String
    var type: EmailType
    
    init(emailAddress: String, type: EmailType) {
        self.emailAddress = emailAddress
        self.type = type
    }
}

class Collaborator {
    var fullName: String
    var birthdate: String
    var email: String
    var fullAddress: Address
    var cep: String
    
    init(fullName: String, birthdate: String, email: String, fullAddress: Address, cep: String) {
        self.fullName = fullName
        self.birthdate = birthdate
        self.email = email
        self.fullAddress = fullAddress
        self.cep = cep
        
    }
}


class Intern: Collaborator {
    var hireDate: String
    var contractFinalDate: String
    var valueOfBenefit: Float
    var pixKey: String

    init(fullName: String, birthdate: String, email: String, fullAddress: Address, cep: String, hireDate: String, contractFinalDate: String, valueOfBenefit: Float, pixKey: String) {
        
        self.hireDate = hireDate
        self.contractFinalDate = contractFinalDate
        self.valueOfBenefit = valueOfBenefit
        self.pixKey = pixKey
        
        super.init(fullName: fullName, birthdate: birthdate, email: email, fullAddress: fullAddress, cep: cep)
        
        
    }
}
class CLT: Collaborator {
    var hireDate: String
    var jobRole: String
    var salary: Double
    var agency: String
    var accountNumber: String
    
    init(fullName: String, birthdate: String, email: String, fullAddress: Address, cep: String, hireDate: String, jobRole: String, salary: Double, agency: String, accountNumber: String) {
        
        self.hireDate = hireDate
        self.jobRole = jobRole
        self.salary = salary
        self.agency = agency
        self.accountNumber = accountNumber
        
        super.init(fullName: fullName, birthdate: birthdate, email: email, fullAddress: fullAddress, cep: cep)
        
       
    }
}

class PJ: Collaborator {
    var hireDate: String
    var contractFinalDate: String
    var hourValue: Double
    var agreedMonthlyMinHours: Float
    var pixKey: String
    
    init(fullName: String, birthdate: String, email: String, fullAddress: Address, cep: String, hireDate: String, contractFinalDate: String, hourValue: Double, agreedMonthlyMinHours: Float, pixKey: String) {
        self.hireDate = hireDate
        self.contractFinalDate = contractFinalDate
        self.hourValue = hourValue
        self.agreedMonthlyMinHours = agreedMonthlyMinHours
        self.pixKey = pixKey
        
        super.init(fullName: fullName, birthdate: birthdate, email: email, fullAddress: fullAddress, cep: cep)
    }
}

class ProjectData {
    var projectName: String
    var numberOfCLT: [String]
    var numberOfPJ: [String]
    var numberOfInterns: [String]
    var grossValue: Float

        
    init(projectName: String, numberOfCLT: [String], numberOfPJ: [String], numberOfInterns: [String], grossValue: Float) {
        self.projectName = projectName
        self.numberOfCLT = numberOfCLT
        self.numberOfPJ = numberOfPJ
        self.numberOfInterns = numberOfInterns
        self.grossValue = grossValue
        
        
        func calcLiquidValue() -> Float {
                for wage in self.numberOfCLT {
                    wage.valueOfBenefit
                    salariesAmount += wage.valueOfBenefit
                    
                }
                for wage in self.clt {
                    wage.salary
                    salariesAmount += Float(wage.salary)
                    
                }
                for wage in self.pj {
                    let total = Float(wage.agreedMonthlyMinHours) * Float(wage.hourValue)
                    salariesAmount += total
                    
                }
                
                return salariesAmount
            
        }
    }
}

class Empresa {
    var intern: [Intern]
    var clt: [CLT]
    var pj: [PJ]
    var salariesAmount: Float = 0
    var ProjectsData: [ProjectData] = []
    
    init(intern: [Intern], clt: [CLT], pj: [PJ]) {
        self.intern = intern
        self.clt = clt
        self.pj = pj
    }
    
    func addProjectToCompany(name : String, clt : [CLT], intern : [Intern], pj : [PJ], value : Float) {
        ProjectsData.append(ProjectData(projectName: name, numberOfCLT: clt, numberOfPJ: pj, numberOfInterns: intern, grossValue: value))
        
    }
    
    func calcuteWholeCompanySalaries() -> Float {
        for wage in self.intern {
            wage.valueOfBenefit
            salariesAmount += wage.valueOfBenefit
            
        }
        for wage in self.clt {
            wage.salary
            salariesAmount += Float(wage.salary)
            
        }
        for wage in self.pj {
            let total = Float(wage.agreedMonthlyMinHours) * Float(wage.hourValue)
            salariesAmount += total
            
        }
        
        return salariesAmount
    }
}
    var person = Intern(fullName: "Pedro Grando", birthdate: "03/11/2003", email: "exemplpo", fullAddress: Address(street: "abc", number: 123, addressComplement: "ap 203", district: "bairro", city: "gylef", uf: UFData.BA, description: ""), cep: "0000", hireDate: "25/11/1998", contractFinalDate: "25/11/2010", valueOfBenefit: 600.10, pixKey: "0538462436564")

    var person2 = PJ(fullName: "Pedro Grando", birthdate: "Pedro Grando", email: "Pedro Grando", fullAddress: Address(street: "Pedro Grando", number: 21, addressComplement: "Pedro Grando", district: "Pedro Grando", city: "Pedro Grando", uf: UFData.BA, description: ""), cep: "Pedro Grando", hireDate: "Pedro Grando", contractFinalDate: "Pedro Grando", hourValue: 30, agreedMonthlyMinHours: 40, pixKey: "Pedro Grando")
    
    var person3 = CLT(fullName: "Pedro Grando", birthdate: "Pedro Grando", email: "Pedro Grando", fullAddress: Address(street: "Pedro Grando", number: 32, addressComplement: "Pedro Grando", district: "Pedro Grando", city: "Pedro Grando", uf: UFData.BA, description: ""), cep: "Pedro Grando", hireDate: "Pedro Grando", jobRole: "Pedro Grando", salary: 1200, agency: "Pedro Grando", accountNumber: "Pedro Grando")

var Ogitrov = Empresa(intern: [person], clt: [person3], pj:[person2])
    Ogitrov.calcuteWholeCompanySalaries()

Ogitrov.addProjectToCompany(name: "ALINE", clt: [Ogitrov.clt[0]], intern: [Ogitrov.intern[0]], pj: [Ogitrov.pj[0]], value: 10000.0)
Ogitrov.ProjectsData[0]
