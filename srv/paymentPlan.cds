//using from './adagency-paymentplan';
using from './adagency-service';
using from './adDetail-service';
using from './adagency-userprofile';
using from '@sap/cds/common';

annotate AdAgencyServices.PaymentPlanDetails with @odata.draft.enabled;

annotate AdAgencyServices.PaymentPlanDetails with @(


UI : {
    SelectionFields     : [preferences_ID],
    LineItem            : [
      //  {Value: cType},
       {
            Value : content_contentType,
            Label : '{i18n>Content}'
        },
        {Value: cSize},
      //  {Value: content.unitOfMeasurement,Label:'Measurement Unit'},
       // {Value: cCost},
        {Value : pType},
        {Value : pCost},
        {Value : startDate},
        {Value : endDate},

    ],
    HeaderInfo          : {
        TypeName       : '{i18n>paymentPlan}',
        TypeNamePlural : '{i18n>Plans}',
        //  Title: {Value: title},
        //Description: {Value:},
        Title          : {Value : ID}


    },


    Facets              : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>Plan Details}',
        Target : '@UI.FieldGroup#General'
    },

    ],
    FieldGroup #General : {Data : [
        //{Value: ID, Label:'{i18n>Book ID}'},
        {
            Value : preferences_ID,
            Label : '{i18n>Preferences}'
        },
        // {Value: content_contentType,Label:'{i18n>Contents}'},

        //{Value:cType},
        //{Value:cSize},
        // {Value:cCost},
        {Value : startDate},
        {
            Value : content_contentType,
            Label : '{i18n>Contents}'
        },
        {Value : endDate},
        // {
        //     Value : userID,
        //     Label : '{i18n>User Id}'
        // },
        {
            Value : adId,
            Label : '{i18n>User and Ad}'
        }


    //                         {
    //     $Type : 'UI.DataFieldWithUrl',
    //     Value : preferences_ID,
    //     Url :'https://www.sap.com',
    //     Label : 'Column label'
    // },
    ]},


},

);

annotate AdAgencyServices.PaymentPlanDetails{
    preferences_ID  @title:'{i18n>Preferences Id}'
}

annotate AdAgencyServices.PaymentPlanDetails with {
    content @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'contentDetails',
            Label           : 'Content Detail',
            SearchSupported : true,
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'content_contentType',
                    // LocalDataProperty : 'content',
                    ValueListProperty : 'contentType',
                },
                // {
                //     $Type             : 'Common.ValueListParameterDisplayOnly',
                //     ValueListProperty : 'unitOfMeasurement'
                // },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'contentSizeLimit'
                }
                // {
                //     $Type             : 'Common.ValueListParameterDisplayOnly',
                //     ValueListProperty : 'contentCost'
                // },
            ]
        }
    });


}


// annotate AdAgencyServices.PaymentPlanDetails with {
//     cSize @(Common : {
//         FieldControl : #Mandatory,
//         ValueList    : {
//             CollectionPath  : 'contentDetails',
//             Label           : 'Content Size',
//             SearchSupported : true,
//             Parameters      : [
//                 {
//                     $Type             : 'Common.ValueListParameterInOut',
//                     LocalDataProperty : 'cSize',
//                     ValueListProperty : 'contentSizeLimit',
//                 },
//                 // {
//                 //     $Type             : 'Common.ValueListParameterDisplayOnly',
//                 //     ValueListProperty : 'contentType'
//                 // },
//                 {
//                     $Type             : 'Common.ValueListParameterDisplayOnly',
//                     ValueListProperty : 'contentType'
//                 },
//                 {
//                     $Type             : 'Common.ValueListParameterDisplayOnly',
//                     ValueListProperty : 'contentCost'
//                 },
//             ]
//         }
//     });


// }

annotate AdAgencyServices.PaymentPlanDetails with {
    preferences @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath : 'preferences',
            Label          : 'Payment Plan',
            //SearchSupported : true,
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'preferences_ID',
                    ValueListProperty : 'ID',
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'preferenceType'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'preferenceCost'
                },

            ]
        }
    });
}

// annotate AdAgencyServices.PaymentPlanDetails with {
//     userID @(Common : {
//         FieldControl : #Mandatory,
//         ValueList    : {
//             CollectionPath  : 'UserProf',
//             Label           : 'User profile',
//             SearchSupported : true,
//             Parameters      : [{
//                 $Type             : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : 'userID',
//                 ValueListProperty : 'ID'
//             }]
//         }
//     });
// }

annotate AdAgencyServices.PaymentPlanDetails with {
    adId @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'AdDetails',
            Label           : 'Ad Id',
            SearchSupported : true,
            Parameters      : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'adId',
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'userID'
            }
            ]
        }
    });
}
