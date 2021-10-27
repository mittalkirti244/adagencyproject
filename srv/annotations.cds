using from './adDetail-service';
using from './adagency-userprofile';
using from '../db/userSchema';
using from '@sap/cds/common';

annotate AdDetailService.AdDetails with @odata.draft.enabled;

annotate AdDetailService.AdDetails with @(UI : {
    SelectionFields     : [
        categoryName,
        userID
    ],
    LineItem            : [
        {
            Value : userID,
            Label : 'User ID',
        },
        {
            $Type : 'UI.DataField',
            Value : ID
        },
        {
            $Type : 'UI.DataField',
            Value : title
        },
        {
            $Type : 'UI.DataField',
            Value : categoryName,
        },
        {
            $Type : 'UI.DataField',
            Value : category_ID,
            Label : 'Category ID'
        },
        {
            $Type : 'UI.DataField',
            Value : adCountry,
            Label : 'Ad Country'
        },
    ],

    HeaderInfo          : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : '{i18n>Ad Detail}',
        TypeNamePlural : '{i18n>Ad List}',
        Title          : {Value : ID},
    },

    Facets              : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>General}',
        Target : '@UI.FieldGroup#General'
    }],

    FieldGroup #General : {Data : [
        {Value : userID},
        {Value : title},
        {Value : textContent},
        {Value : category_ID},
        {Value : adCountry},
        {
            Value : image,
            Label : 'File Name'
        }
    ]}
}, );

annotate AdDetailService.AdDetails with {
    @UI.MultiLineText
    textContent
};


// annotate AdDetailService.AdDetails with {
//     @UI.IsImageUrl : true
//     image
// };

annotate AdDetailService.AdDetails with {
    ID           @title : '{i18n>Ad ID}';
    title        @title : '{i18n>Ad Title}';
    categoryName @title : '{i18n>Category Name}';
    textContent  @title : '{i18n> Text Content}';
    userID       @title : '{i18n> User ID}';
    adCountry    @title : '{i18n>Country}';
}

annotate AdDetailService.AdDetails with {
    category @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'Category',
            Label           : 'Category',
            SearchSupported : true,
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'category_ID',
                ValueListProperty : 'ID'
            },
             {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }, 
            ]
        }
    });
}

// annotate AdDetailService.AdDetails with {
//     category_ID @(Common : {
//         FieldControl : #Mandatory,
//         ValueList    : {
//             CollectionPath  : 'Category',
//             Label           : 'Category',
//             SearchSupported : true,
//             Parameters      : [{
//                 $Type             : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : 'category_ID',
//                 ValueListProperty : 'ID'
//             }]
//         }
//     });
// }

annotate AdDetailService.AdDetails with {
    userID @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'UserProf',
            Label           : 'User profile',
            SearchSupported : true,
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'userID',
                ValueListProperty : 'ID'
            }]
        }
    });
}

annotate AdDetailService.AdDetails with {
    adCountry @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'CountryText',
            Label           : 'Country Text',
            SearchSupported : true,
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'adCountry',
                    ValueListProperty : 'Country'
                },
                {
                    $Type             : 'Common.ValueListParameterFilterOnly',
                    ValueListProperty : 'countryName'
                },
                {
                    $Type             : 'Common.ValueListParameterFilterOnly',
                    ValueListProperty : 'language'
                }
            ]
        }
    });
}

// annotate AdDetailService.Category with {
//     ID   @title : '{i18n>Category ID}';
//     name @title : '{i18n>Category Name}'
// }
annotate AdDetailService.Category with @odata.draft.enabled;

annotate AdDetailService.Category with @(

UI : {

    SelectionFields     : [name],

    LineItem            : [

        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID'
        },

        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Category'
        },

    ],


    HeaderInfo          : {

        TypeName       : 'Category',
        TypeNamePlural : 'Category',

        Title          : {
            Value : name,
            Label : 'Category'
        },

    },

    Facets              : [

    {
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>Description}',
        Target : '@UI.FieldGroup#General'
    }


    ],

    FieldGroup #General : {

    Data : [

    {
        Value : Description,
        Label : 'Description'
    }]

    },


},


);
