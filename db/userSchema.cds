namespace adagency;

entity User {

        key profileId          : UUID @odata.Type : 'Edm.String'  @Core.Computed;
   // key profileId   : String @title : '{i18n>Profile Id}';
        firstName   : String;
        lastName    : String;
        email       : String;
        gender      : Association to Gender;
        phoneNumber : String;
        password    : String;
        street      : String;
        city        : String;
        state       : String;
        pinCode     : String;

}

// type GenderID: String enum {
// male         = 'M';
// female       = 'F';
// nonBinary    = 'N';
// };

entity Gender {
    key code: String;
}


// entity Gender {
//   //  key ID : Integer;
//     key Type   : String(1) enum {
//     male         = 'M';
//     female       = 'F';
//     nonBinary    = 'N';
//     noDisclosure = 'D';
//     selfDescribe = 'S';
// }
// }
