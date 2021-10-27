namespace adagency;

entity User {
        ID          : UUID @odata.Type : 'Edm.String'  @Core.Computed;
    key profileId   : String;
        firstName   : String;
        lastName    : String;
        email       : String;
        phoneNumber : String;
        gender      : String;
        password    : String;
        address     : Address;
}

type Address {
    street  : String;
    city    : String;
    state   : String;
    pinCode : String;
}

type Gender : String(1) enum {
    male         = 'M';
    female       = 'F';
    nonBinary    = 'N';
    noDisclosure = 'D';
    selfDescribe = 'S';
  }

  annotate Gender with @(
    title       : '{i18n>gender}',
    description : '{i18n>gender}',
    assert.enum
  );
