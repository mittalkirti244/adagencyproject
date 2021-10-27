namespace adagency;

entity User {

        //   ID          : UUID @odata.Type : 'Edm.String'  @Core.Computed;
    key profileId   : String @title : '{i18n>Profile Id}';
        firstName   : String;
        lastName    : String;
        email       : String;
        gender      : Gender;
        phoneNumber : String;
        password    : String;
        street      : String;
        city        : String;
        state       : String;
        pinCode     : String;

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
