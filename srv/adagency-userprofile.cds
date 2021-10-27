using adagency as Ad from '../db/userSchema';

service UserProfile {
    @Capabilities : {
        Insertable : true,
        Deletable  : true
    }
    entity User as projection on Ad.User;
}
