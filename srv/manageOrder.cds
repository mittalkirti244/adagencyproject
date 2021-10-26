using from './manageOrder-service';

annotate ManageOrdersService.ManageOrder with @odata.draft.enabled;
annotate ManageOrdersService.ManageOrder with @( 
UI:{
     Identification: [{Value:ID}],
    
     SelectionFields: [ID,status],
    LineItem:[
        {
            $Type: 'UI.DataField',
            Value: ID,
            Label:'{i18n>ID}'
            },
        {
            $Type: 'UI.DataField',
            Value: planID, 
            Label:'{i18n>Plan ID}'
            },
       {
           $Type: 'UI.DataField',
           Value: description,
           Label:'{i18n>Description}'
           },
      
        {
            $Type: 'UI.DataField',
            Value: address, 
            Label:'{i18n>Address}'
            },

        {
            $Type: 'UI.DataField',
            Value: country, 
            Label:'{i18n>Country}'
            },


        {
            $Type: 'UI.DataField',
            Value: createdBy, 
            Label:'{i18n>Customer Name}'
            },
          {
            $Type: 'UI.DataField',
            Value: createdAt, 
            Label:'{i18n>Order Date}'
            },

       {
           $Type: 'UI.DataField',
           Value : totalAmount, 
           Label:'{i18n>Total Amount}'
           },
        {
            $Type: 'UI.DataField',
            Value : status, 
            Label:'{i18n>Status}'
            }
 
    ],
    HeaderInfo:{
        TypeName: '{i18n>ManageOrder}',
        TypeNamePlural: '{i18n>Manage Order}',
        Title: {Value: ID},
        //Description: {Value: title}
        
    },

    HeaderFacets  : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Order}',
            Target : '@UI.FieldGroup#Order'

        },
        
    ],
     
    FieldGroup #Order : { Data :[

        {Value : createdBy},
        {Value : createdAt}

    ]
        },

     Facets: [
    
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}',Target: '@UI.FieldGroup#Details'},
        ],
         FieldGroup#Details: {
            Data: [
                {Value: planID,Label:'{i18n>Plan ID}'},
                {Value: description,Label:'{i18n>Description}'},
                {Value: address,Label:'{i18n>Address}'},
                {Value: country,Label:'{i18n>Country}'},
                {Value: totalAmount,Label:'{i18n>Total Amount}'},
                {Value: status,Label:'{i18n>Status}',},
            ]
        },
},
    
 
);


annotate ManageOrdersService.ManageOrder with {
    ID @title:'{i18n>ID}' @UI.HiddenFilter @Core.Computed;
}

annotate ManageOrdersService.ManageOrder with{
status @(Common : {
        ValueListWithFixedValues,
        ValueList : {
            $Type          : 'Common.ValueListType',
            CollectionPath : 'StatusCode',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'status',
                    ValueListProperty : 'code'
                },
            ]
        },
    })
};

annotate ManageOrdersService.ManageOrder with{
country @(Common : {
        FieldControl : #Mandatory,
        ValueList : {
            CollectionPath : 'CountryText',
            Label          : 'Country Text',
            SearchSupported: true,
            Parameters     : [
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
        },
    })
};

