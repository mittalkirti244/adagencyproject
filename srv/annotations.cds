using from './adDetail-service';
using from '@sap/cds/common';

annotate AdDetailService.AdDetails with @odata.draft.enabled;

annotate AdDetailService.AdDetails with @(UI : {
    SelectionFields     : [categoryName],
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
        {Value : categoryName},
        {Value : adCountry},
        {
            Value : graphicContent.image,
            Label : 'File Name'
        }
    ]}
}, );

annotate AdDetailService.AdDetails with {
    @UI.MultiLineText
    textContent
};


annotate AdDetailService.AdDetails with {
    @UI.IsImageUrl : true
    image
};

annotate AdDetailService.AdDetails with {
    ID           @title : '{i18n>Ad ID}';
    title        @title : '{i18n>Ad Title}';
    categoryName @title : '{i18n>Category Name}';
    textContent  @title : '{i18n> Text Content}';
    userID       @title : '{i18n> User IDs}';
}

annotate AdDetailService.AdDetails with {
    categoryName @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'Category',
            Label           : 'Category',
            SearchSupported : true,
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'categoryName',
                ValueListProperty : 'name'
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

annotate AdDetailService.Category with {
    ID   @title : '{i18n>Category ID}';
    name @title : '{i18n>Category Name}'
}
