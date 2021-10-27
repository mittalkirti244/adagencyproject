namespace adagency;

entity User {
        ID          : UUID @odata.Type : 'Edm.String'  @Core.Computed;
    key profileId   : String;
        firstName   : String;
        lastName    : String;
        email       : String;
        phoneNumber : String;
        gender      : String
        enum{
            Male;
            Female
        };
        password    : String;
        address     : Address;
}

type Address {
    street  : String;
    city    : String;
    state   : String;
    pinCode : String;
}

type Gender : String enum {
    Male;
    Female
}
