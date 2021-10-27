using from './adagency-userprofile';

annotate UserProfile.User with @odata.draft.enabled;

annotate UserProfile.User with @(UI : {
    LineItem            : [
        // {
        //     Value : address_ID,
        //     Label : 'Profile ID',
        // },
        {
            $Type : 'UI.DataField',
            Value : firstName

        },
        {
            $Type : 'UI.DataField',
            Value : lastName
        },
        {
            $Type : 'UI.DataField',
            Value : email
        },
        {
            $Type : 'UI.DataField',
            Value : phoneNumber
        },
        {
            $Type : 'UI.DataField',
            Value : gender
        },
        {
            $Type : 'UI.DataField',
            Value : street,
            Label : '{i18n>Street}'
        },
        {
            $Type : 'UI.DataField',
            Value : city,
            Label : '{i18n>City}'
        },
        {
            $Type : 'UI.DataField',
            Value : state,
            Label : '{i18n>State}'
        },
        {
            $Type : 'UI.DataField',
            Value : pinCode,
            Label : '{i18n>Pincode}'
        },


    ],
    HeaderInfo          : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : '{i18n>User Profile}',
        TypeNamePlural : '{i18n>Users List}',
        Title          : {Value : profileId},
    },


    Facets              : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>General}',
        Target : '@UI.FieldGroup#General'
    }],

    FieldGroup #General : {Data : [
        {Value : firstName},
        {Value : lastName},
        {Value : gender},
        {Value : email},
        {Value : phoneNumber},
        {Value : password},
        {
            $Type : 'UI.DataField',
            Value : street,
            Label : '{i18n>Street}'
        },
        {
            $Type : 'UI.DataField',
            Value : city,
            Label : '{i18n>City}'
        },
        {
            $Type : 'UI.DataField',
            Value : state,
            Label : '{i18n>State}'
        },
        {
            $Type : 'UI.DataField',
            Value : pinCode,
            Label : '{i18n>Pincode}'
        }

    ]}
}, );

annotate UserProfile.User with {
    @UI.MultiLineText street
};

annotate UserProfile.User with {
    ID              @title : '{i18n>User ID}';
    firstName       @title : '{i18n>First Name}';
    lastName        @title : '{i18n>Last Name}';
    gender          @title : '{i18n>Gender}';
    email           @title : '{i18n>Email}';
    phoneNumber     @title : '{i18n>Phone Number}';
    password        @title : '{i18n>Password}';
    street  @title : '{i18n>Street}';
    city    @title : '{i18n>City}';
    state   @title : '{i18n>State}';
    pinCode @title : '{i18n>Pincode}';


}

annotate UserProfile.User with {

    gender @(Common : {

        FieldControl : #Mandatory,
        ValueListWithFixedValues,

        ValueList    : {

            CollectionPath : 'User',
            Label          : 'User Gender',

            // SearchSupported : true,

            Parameters     : [{

                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'gender',
                ValueListProperty : 'gender'

            }]

        }

    });

}
