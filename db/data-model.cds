namespace adagency;

using {cuid} from '@sap/cds/common';

//using {country as c} from '../srv/external/country';
//using {country as c} from '../srv/adDetail-service';
//using {CountryText as Country/} from '../srv/adDetail-service';

entity AdDetails : cuid {
    key ID             : UUID        @odata.Type       : 'Edm.String'  @Core.Computed;
     //  key ID : String @odata.Type       : 'Edm.String'  @Core.Computed;
        userID         : String; 
        //@cds.on.insert:$now;
        title          : String;
        textContent    : LargeString;
        adCountry      : String(3);
        adLanguage     : String(2);
        imageType      : String(60)  @Core.IsMediaType : true;
        image          : LargeBinary @Core.MediaType   : imageType  @Core.ContentDisposition.Filename : fileName;
        fileName       : String;
        category       : Association to Category;
        graphicContent : Association to many GraphicContent
                             on graphicContent.addetails = $self;
}

entity Category {
    key ID          : UUID @odata.Type : 'Edm.String'  @Core.Computed;
        name        : String;
        Description : String;
}

entity GraphicContent {
    key ID        : UUID        @odata.Type       : 'Edm.String'  @Core.Computed;
        imageType : String      @Core.IsMediaType : true;
        image     : LargeBinary @Core.MediaType   : imageType  @Core.ContentDisposition.Filename : fileName;
        fileName  : String;
        addetails : Association to AdDetails;
}
