
using from './adagency-userprofile';

annotate UserProfile.User with @odata.draft.enabled;
annotate UserProfile.User with @(UI : {
    LineItem            : [
        {
            Value : ID,
            Label : 'User ID',
        },
        {
            $Type : 'UI.DataField',
            Value : firstName
        }
    ],

    HeaderInfo          : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : '{i18n>User Profile}',
        TypeNamePlural : '{i18n>Users List}',
        Title          : {Value : ID},
    },

    Facets              : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>General}',
        Target : '@UI.FieldGroup#General'
    }],

    FieldGroup #General : {Data : [
        {Value : firstName},
        {Value : lastName},
        {Value: gender},
        {Value : email},
        {Value : phoneNumber},
        {Value: password},
        {Value:address_street},
        {Value:address_state},
        {Value: address_city},
        {Value: address_pinCode},

    ]}
}, );

annotate UserProfile.User  with {
    @UI.MultiLineText
    address_street
};

annotate UserProfile.User  with {
    ID           @title : '{i18n>User ID}';
    firstName        @title : '{i18n>First Name}';
    lastName @title : '{i18n>Last Name}';
    gender  @title : '{i18n>Gender}';
    email       @title : '{i18n>Email}';
}

annotate UserProfile.User with {
    gender @(Common : {
        FieldControl : #Mandatory,
        ValueListWithFixedValues,
        ValueList    : {
            CollectionPath  : 'User',
            Label           : 'User Gender',
           // SearchSupported : true,
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'gender',
                ValueListProperty : 'gender'
            }]
        }
    });
}
