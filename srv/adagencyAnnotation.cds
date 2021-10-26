using from './adagency-service';
using from '@sap/cds/common';

annotate AdAgencyServices.preferences with @odata.draft.enabled;

annotate AdAgencyServices.preferences with @(


UI : {
    SelectionFields     : [preferenceType],
    LineItem            : [

        // {
        //     // $Type : 'UI.DataField',
        //     // Value : ID,
        //     // Label : '{i18n>ID}'
        // },
        {
            $Type : 'UI.DataField',
            Value : preferenceType,
            Label : '{i18n>Type}'
        },
        {
            $Type : 'UI.DataField',
            Value : preferenceCost,
            Label : '{i18n>Cost}'
        },

    ],
    HeaderInfo          : {
        TypeName       : '{i18n>Preference}',
        TypeNamePlural : '{i18n>Preferences List}',
        Title          : {Value : preferenceType}
        


    },
Facets              : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>Preference Details}',
        Target : '@UI.FieldGroup#General'
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>Description}',
        Target : '@UI.FieldGroup#Details'
    }
],
    FieldGroup #General : {Data : [
        {
            Value : preferenceType,
            Label : '{i18n>Preference Type}',

        },
        {
            Value : preferenceCost,
            Label : '{i18n>Preference Cost}',
        },
    ]},


FieldGroup #Details : {Data : [
        {
            Value : desc,
            Label : '{i18n>Description}',

        },
    ]},

},

);


annotate AdAgencyServices.preferences with {
    preference @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath : 'Preferences',
            Label          : 'Preferences',
            //SearchSupported : true,
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterOut',
                    LocalDataProperty : 'preferenceType',
                    ValueListProperty : 'preferenceType',
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'preferenceCost'
                },

            ]
        }
    });


}

//##########################################Content#############################################
annotate AdAgencyServices.contentDetails with @odata.draft.enabled;

annotate AdAgencyServices.contentDetails with @(

UI : {
    SelectionFields     : [contentType],
    LineItem            : [
       // {Value : ID},
        {Value : contentType},
        {Value : contentSizeLimit},
        {Value : contentCost},
        {Value:unitOfMeasurement}


    ],
    HeaderInfo          : {
        TypeName       : '{i18n>Contents}',
        TypeNamePlural : '{i18n>ContentDetails List}',
        //  Title: {Value: title},
        //Description: {Value:},
        Title          : {Value : contentType}


    },


    Facets              : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>Content Details}',
        Target : '@UI.FieldGroup#General'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n> Description}',
        Target : '@UI.FieldGroup#Details'
    },

    ],
    FieldGroup #General : {Data : [
        {Value : contentType},
        {Value : contentSizeLimit},
        {Value : contentCost},
        {Value: unitOfMeasurement}

    ]},
    FieldGroup #Details : {Data : [
        {Value : desc},
        

    ]},


},

);


annotate AdAgencyServices.ContentDetails with {
    content @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath : 'ContentDetails',
            Label          : 'Content Details',
            //SearchSupported : true,
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterOut',
                    LocalDataProperty : 'contentType',
                    ValueListProperty : 'contentType',
                },

                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'contentSize'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'contentCost'
                },
                {
                   $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'unitOfMeasurement' 
                }
            ]
        }
    });


}
