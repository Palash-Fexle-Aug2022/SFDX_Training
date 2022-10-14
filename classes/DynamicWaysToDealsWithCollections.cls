/**
*
*  Purpose          :	Class to fill Map with dynamic Key-Value Pair.
*
*  Created Date     :  	09/02/2022
*
*  Created By       :  	Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
public with sharing class DynamicWaysToDealsWithCollections {
    public static Map<String, Map<String, List<Student__c>>> DynamicWaysToDealsWithCollections() {
       Map<String, Map<String, List<Student__c>>> mapOfSchoolNameWithClassNameAndRelatedStudentsDetails =
        new Map<String, Map<String, List<Student__c>>>();
            List<Student__c> studentDetailList = [SELECT ID, Name, Date_of_Birth__c, Class__c,Class__r.Name,
                                                        Class__r.School__c,Class__r.School__r.Name FROM Student__c 
                                                        WHERE Class__c != null AND Class__r.School__c != null
                                                 ];
            for (Student__c student : studentDetailList){
                if(mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.containsKey(student.Class__r.School__r.Name)){
                    mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.get(student.Class__r.School__r.Name);
                        if(mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.get(student.Class__r.School__r.Name).containsKey(student.Class__r.Name)){
                            mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.get(student.Class__r.School__r.Name).get(student.Class__r.Name).add(student);
                        }
                            else{
                                mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.get(student.Class__r.School__r.Name)
                                    .put(student.Class__r.Name, new List<Student__c>{student});
                            }
                }       
                else{
                    Map<String, List<Student__c>> classandStudent = new Map<String,List<Student__c>>();
                    if(classandStudent.get(student.Class__r.Name)==null){
                        classandStudent.put(student.Class__r.Name, new List<Student__c>());
                    }
                    classandStudent.get(student.Class__r.Name).add(student);
                    mapOfSchoolNameWithClassNameAndRelatedStudentsDetails.put(student.Class__r.School__r.Name,classandStudent);
                }
            }
        return mapOfSchoolNameWithClassNameAndRelatedStudentsDetails;
    }
}