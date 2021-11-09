using from './manageOrder-service';
using from './adagency-userprofile';
using from './adagency-service';
using from './adDetail-service';

annotate ManageOrdersService.ManageOrder with @odata.draft.enabled;


annotate ManageOrdersService.ManageOrder with @(UI : {
    Identification      : [{Value : ID}],
    SelectionFields     : [
        ID,
        status_code
    ],
    LineItem            : [

        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : '{i18n>Order ID}'
        },
        {
            $Type : 'UI.DataField',
            Value : planID,
            Label : '{i18n>Plan ID}'
        },
        {
            $Type : 'UI.DataField',
            Value : address,
            Label : '{i18n>Address}'
        },

        {
            $Type : 'UI.DataField',
            Value : country,
            Label : '{i18n>Country}'
        },


        // {
        //     $Type: 'UI.DataField',
        //     Value: createdBy, 
        //     Label:'{i18n>Customer Name}'
        //     },
        //   {
        //     $Type: 'UI.DataField',
        //     Value: createdAt, 
        //     Label:'{i18n>Order Date}'
        //     },

       {
           $Type: 'UI.DataField',
           Value : totalAmount, 
           Label:'{i18n>Total Amount}'
           },

        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : '{i18n>Status}'
        }

    ],
    HeaderInfo          : {
        TypeName       : '{i18n>ManageOrder}',
        TypeNamePlural : '{i18n>Manage Order}',
        Title          : {
            Label : 'Order ID',
            Value : ID
        },
    },

    // HeaderFacets        : [{
    //     $Type  : 'UI.ReferenceFacet',
    //     Label  : '{i18n>Order}',
    //     Target : '@UI.FieldGroup#Order'

    // },


       // {Value : createdBy},
       // {Value : createdAt}

    // ],


    FieldGroup #Order   : {Data : [

                                   // {Value : createdBy},
                                   // {Value : createdAt}

                                  ]},

    Facets              : [

    {
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>Details}',
        Target : '@UI.FieldGroup#Details'
    }, 
    ],
    FieldGroup #Details : {Data : [
        {
            Value : userID,
            Label : 'User'
        },
        {
            Value : adID,
            Label : 'User Ads'
        },
        {
            Value : planID,
            Label : 'Ad Plan'
        },
        {
            Value : address,
            Label : '{i18n>Address}'
        },
        {
            Value : country,
            Label : '{i18n>Country}'
        },
        {
            Value : totalAmount,
            Label : '{i18n>Total Amount}'
        },
        {
            Value : status_code,
            Label : '{i18n>Status}',
        }
    ]},
});


annotate ManageOrdersService.ManageOrder with {
    ID      @title : '{i18n>ID}'  @UI.HiddenFilter  @Core.Computed;
    address @UI.MultiLineText
}

annotate ManageOrdersService.ManageOrder with {
    status @(Common : {
        ValueListWithFixedValues,
        ValueList : {
            $Type          : 'Common.ValueListType',
            CollectionPath : 'StatusCode',
            Parameters     : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'status_code',
                ValueListProperty : 'code'
            }, ]
        },
    })
};

annotate ManageOrdersService.ManageOrder with {
    userID @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'UserDetails',
            Label           : 'User profile',
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

annotate ManageOrdersService.ManageOrder with {
    adID @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'AdDetails',
            Label           : 'Ad Id',
            SearchSupported : true,
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterIn',
                    LocalDataProperty : 'userID',
                    ValueListProperty : 'userID',
                },
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'adID',
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

annotate ManageOrdersService.ManageOrder with {
    planID @(Common : {
                       // ValueListWithFixedValues,
                      ValueList : {
        $Type          : 'Common.ValueListType',
        CollectionPath : 'PlanDetails',
        Parameters     : [
            {
                $Type             : 'Common.ValueListParameterIn',
                LocalDataProperty : 'adID',
                ValueListProperty : 'adId',
            },
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'planID',
                ValueListProperty : 'ID'
            }
        ]
    }, })
};


annotate ManageOrdersService.ManageOrder with {
    totalAmount @(Common : {
                            // ValueListWithFixedValues,
                           ValueList : {
        $Type          : 'Common.ValueListType',
        CollectionPath : 'PlanDetails',
        Parameters     : [
            {
                $Type             : 'Common.ValueListParameterIn',
                LocalDataProperty : 'planID',
                ValueListProperty : 'ID',
            },
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'totalAmount',
                ValueListProperty : 'totalAmount'
            }
        ]
    }, })
};

annotate ManageOrdersService.ManageOrder with {
    country @(Common : {
                        //  FieldControl : #Mandatory,
                       ValueList : {
        CollectionPath  : 'CountryText',
        Label           : 'Country Text',
        SearchSupported : true,
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'country',
                ValueListProperty : 'Country'
            },
            {
                $Type             : 'Common.ValueListParameterFilterOnly',
                ValueListProperty : 'CountryName'
            },
            {
                $Type             : 'Common.ValueListParameterFilterOnly',
                ValueListProperty : 'Language'
            },
        ]
    }, })
};