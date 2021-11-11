//using from './adagency-paymentplan';
using from './adagency-service';
using from './adDetail-service';
using from './adagency-userprofile';
using from '@sap/cds/common';

annotate AdAgencyServices.PaymentPlanDetails with @odata.draft.enabled;

annotate AdAgencyServices.PaymentPlanDetails with @(


UI : {
   // SelectionFields     : [preferences.preferenceType,content_contentType],
    LineItem            : [
        //  {Value: cType},
        {
            Value: userID,
            Label: 'User ID'
        },
        {
            Value: adId,
            Label:'Ad ID'
        },
        {
            Value : content_contentType,
            Label : '{i18n>Content}'
        },
        {Value : content.contentSizeLimit},
        //  {Value: content.unitOfMeasurement,Label:'Measurement Unit'},
        {Value: content.contentCost, Label: 'Content Cost'},
        {Value : preferences.preferenceType},
        {Value : preferences.preferenceCost, Label: 'Preference Cost'},
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
        {
            Value : userID,
            Label : '{i18n>Select User}'
        },
        {
            Value : adId,
            Label : '{i18n>Select User Ad}'
        },
        {
            Value : preferences_ID,
            Label : '{i18n>Preferences}'
        },
        {
            Value : content_contentType,
            Label : '{i18n>Contents}'
        },
        {Value : startDate},
        {Value : endDate},
        // {
        //     $Type : 'UI.DataField',
        //     Value : totalCost
        // }


    //                         {
    //     $Type : 'UI.DataFieldWithUrl',
    //     Value : preferences_ID,
    //     Url :'https://www.sap.com',
    //     Label : 'Column label'
    // },
    ]},
});

annotate AdAgencyServices.PaymentPlanDetails {
    preferences_ID @title : '{i18n>Preferences Id}'
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
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'contentSizeLimit'
                },
                {
                     $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'contentCost'
                }
            ]
        }
    });


}


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

annotate AdAgencyServices.PaymentPlanDetails with {
    userID @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'UserProf',
            Label           : 'User profile',
            // FetchValues : 2,
            SearchSupported : true,
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'userID',
                    ValueListProperty : 'profileId'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'firstName',
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'email'
                }
            ]
        }
    });
}

annotate AdAgencyServices.PaymentPlanDetails with {
    adId @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'AdDetails',
            Label           : 'Ad Id',
            SearchSupported : true,
            // DistinctValuesSupported :HasActiveEntity,
            // PresentationVariantQualifier : 'userID',
            // SelectionVariantQualifier : 'userID',
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterIn',
                    LocalDataProperty : 'userID',
                    ValueListProperty : 'userID',
                },
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'adId',
                    ValueListProperty : 'ID',
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'title',
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'categoryName',
                }
            ]
        }
    });
}
