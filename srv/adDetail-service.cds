using adagency as Ad from '../db/data-model';
using {country as c} from './external/country';
using {UserProfile as u }from './adagency-userprofile';

//using { country as c } from './external/country.csn';

service AdDetailService {
    @Capabilities : {
        Insertable : true,
        Deletable  : true,
        
    }
    // extend AdDetails {
    //     adCountry : Association to one CountryText;
    // }
    
    entity AdDetails      as projection on Ad.AdDetails {
        * , category.name as categoryName
    };
@readonly
    entity UserProf as projection on u.User;

    @Capabilities : {
        Insertable : true,
        Deletable  : true
    }
    entity Category       as projection on Ad.Category;

    @Capabilities : {
        Insertable : true,
        Deletable  : true
    }
    entity GraphicContent as projection on Ad.GraphicContent;

    @readonly
    entity Country        as projection on c.A_Country {
        key Country
    };

    @readonly
    entity CountryText    as projection on c.A_CountryText {
        key Country, CountryName as countryName, Language as language
    };





}