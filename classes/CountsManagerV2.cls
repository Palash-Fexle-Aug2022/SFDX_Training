/**
*
*  Purpose          :	Class to count and update Number of Students and Number of Classes on a School Record.
*
*  Created Date     :  	09/12/2022
*
*  Created By       :  	Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
public class CountsManagerV2 {
    public void updateNoOfStudentsDetails(String schoolName){
        if(schoolName!=null){
        Map<ID,School__c> mapWithSchoolDetails = new Map<ID,School__c>();
        List<School__c> schoolDetailsList = [SELECT ID, Name FROM School__c WHERE Name=: schoolName];
        //System.debug(schoolDetailsList);
        if(schoolDetailsList.size()>0){
        for (School__c school : schoolDetailsList) {
            if (!mapWithSchoolDetails.containsKey(school.ID)){
                mapWithSchoolDetails.put(school.ID,school);
            } 
        }
        Map<ID,Integer> mapWithStudentDetails = new Map<ID,Integer>(); 
        for(Student__c student : [SELECT ID, Name, Class__r.School__c 
                                    FROM Student__c 
                                        WHERE Class__r.School__c =: mapWithSchoolDetails.Keyset()]){
            if(!mapWithStudentDetails.containsKey(student.Class__r.School__c)){
                mapWithStudentDetails.put(student.Class__r.School__c,1);
            }
            else{
                mapWithStudentDetails.put(student.Class__r.School__c,(mapWithStudentDetails.get(student.Class__r.School__c)+1));
            }
            
            
        }
        if(mapWithStudentDetails.size()>0){
            List<School__c>  noOfSchoolList = new List<School__c>();
            for(ID schoolID : mapWithStudentDetails.Keyset()){
                School__c schoolCount = new School__c();
                schoolCount.Id = schoolID;
                schoolCount.Number_of_Students__c=mapwithStudentDetails.get(schoolID);
                noOfSchoolList.add(schoolCount);
            }
            if(noOfSchoolList!= null && noOfSchoolList.size()>0){
                update noOfSchoolList;
            }
        }
        }
        else{
            System.debug('Unable to find School with the given name.');
        }
        }
        else{
            System.debug('No School Found');
        }
    }
    public void updateNoOfClassDetails(ID schoolID) {
        if(schoolID!=null){
            List<School__c> classNameList = [SELECT ID, Name,(SELECT Name FROM Classes__r) FROM School__c 
                                             WHERE School__c.ID =: schoolID];
            
            if(classNameList.size() > 0){
                
                List<School__c> noOfClassList = new List<School__c>();
                
                for(School__c classDetails : classNameList){                
                    Integer classCount = classDetails.Classes__r.size();
                    School__c schoolDetails = new School__c();
                    schoolDetails.ID = classDetails.ID;
                    schoolDetails.Number_of_Classes__c = classCount;
                    noOfClassList.add(schoolDetails);
                }
                if(noOfClassList.size() > 0){
                    update noOfClassList;
                }
            }
            else{
                System.debug('Unable to find school for given Record ID.');
            }
        }
        else{
            System.debug('Unable to find a school.');
        }        
    }
}