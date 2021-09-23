class Calendar:
    def __init__(self, feast, startDate, endDate, location, localBandClubs, image):
        self.__image = image
        self.__feast = feast
        self.__startDate = startDate
        self.__endDate = endDate
        self.__location = location
        self.__localBandClubs = localBandClubs
            
    def get_image(self):
        return self.__image

    def get_feast(self):
        return self.__feast

    def get_startDate(self):
        return self.__startDate

    def get_endDate(self):
        return self.__endDate

    def get_location(self):
        return self.__location

    def get_localBandClubs(self):
        return self.__localBandClubs

class Bandist:
    def __init__(self, image, firstName, lastName, mobile, telephone, address, email, instrument):
        self.__ID = id(self)
        self.__image = image
        self.__firstName = firstName
        self.__lastName = lastName
        self.__mobile = mobile
        self.__telephone = telephone
        self.__address = address
        self.__email = email
        self.__instrument = instrument

    def get_ID(self):
        return self.__ID
    
    def set_image(self, image):
        self.__image = image

    def get_image(self):
        return self.__image

    def set_firstName(self, firstName):
        self.__firstName = firstName

    def get_firstName(self):
        return self.__firstName;

    def set_lastName(self, lastName):
        self.__lastName = lastName

    def get_lastName(self):
        return self.__lastName

    def set_mobile(self, mobile):
        self.__mobile = mobile

    def get_mobile(self):
        return self.__mobile

    def set_telephone(self, telephone):
        self.__telephone = telephone

    def get_telephon(self):
        return self.__telephone

    def set_address(self, address):
        self.__address = address

    def get_address(self):
        return self.__address
    
    def set_email(self, email):
        self.__email = email

    def get_email(self):
        return self.__email

    def set_instrument(self, instrument):
        self.__instrument = instument

    def get_instrument(self):
        return self.__instrument

class Servizz:
    def __init__(self, feast, location, date, time, servizzType, image):
        self.__ID = id(self)
        self.__image = image
        self.__feast = feast
        self.__location = location
        self.__date = date
        self.__time = time
        self.__servizzType = servizzType

    def get_ID(self):
        return self.__ID

    def get_image(self):
        return self.__image

    def set_feast(self, feast):
        self.__feast = feast

    def get_feast(self):
        return self.__feast

    def set_location(self, location):
        self.__location = location

    def get_location(self):
        return self.__location

    def set_date(self, date):
        self.__date = date

    def get_date(self):
        return self.__date

    def set_time(self, time):
        self.__time = time

    def get_time(self):
        return self.__time

    def set_servizzType(self, servizzType):
        self.__servizzType = servizzType

    def get_servizzType(self):
        return self.__servizzType

class Record:
    def __init__(self, bandistID, servizzID):
        self.__ID = id(self)
        self.__bandistID = bandistID
        self.__servizzID = servizzID

    def get_ID(self):
        return self.__ID

    def get_bandistID(self):
        return self.__bandistID

    def get_servizzID(self):
        return self.__servizzID

class Records:
    def __init__(self):
        self.__records = {}
    
    def addRecord(self, bandistID, servizzID):
        record = Record(bandistID, servizzID)
        self.__records[record.get_ID()] = record

    def deleteRecord(self, ID):
        del self.__records[ID]

