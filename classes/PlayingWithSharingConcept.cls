/**
*
*  Purpose          :	Class to understand sharing concepts.
*
*  Created Date     :  	10/3/2022
*
*  Created By       :  	Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
public class PlayingWithSharingConcept {
    public static void PlayingWithSharingConcept(){
        List<School__c> schoolList = [SELECT ID,Name FROM School__c];
        System.debug(schoolList);
    }
}