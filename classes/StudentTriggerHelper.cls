/**
*
*  Purpose          :	Helper Class for Trigger on Student object.
*
*  Created Date     :  	10/13/2022
*
*  Created By       :  	Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
public without sharing class StudentTriggerHelper 
{
    //Method by Abhinav Sir
    public static void updateNoOfStudentsDetails(List<Student__c> students, Map<Id, Student__c> mapOfOldStudents) 
    {
        Set<Id> setOfParentSchools = new Set<Id>();
        for(Student__c std : students != null ? students : mapOfOldStudents.values()) 
        {
            if(std.School__c != null) 
            {
                setOfParentSchools.add(std.School__c);
            }
        }
        
        if(setOfParentSchools.size() > 0) 
        {
            //An additional query because trigger.new is a read only collection in case of after event
            Map<Id, School__c> mapOfSchools = new Map<Id, School__c>();
            for(School__c sch : [SELECT ID, No_of_Students__c 
                                 FROM School__c
                                 WHERE ID IN : setOfParentSchools
                                ]) 
            {
                mapOfSchools.put(sch.Id, sch);
            }
            if(mapOfSchools.values().size() > 0) 
            {
                CountsManager.doCalculationForNoOfStudents(mapOfSchools);        
            }
        }
    }
    
    //Method By Palash Singh
    /*public static void updateClassAndSchoolFieldOnStudent(List<Student__c> students, Map<Id, Student__c> mapOfOldStudents)
    {
        Set<Id> setOfClassIds = new Set<Id>();
        for(Student__c std : students != null ? students : mapOfOldStudents.values()) 
        { 
            if(std.Class__c != null) 
            {
                setOfClassIds.add(std.Class__c);
            }
        }
        List<Class__c> clsList = [SELECT ID, Name, School__c FROM Class__c WHERE ID IN: setOfClassIds];
        if(clsList.size() > 0)
        {
        	for(Class__c cls : clsList)
        	{
        		for(Student__c stnd : students)
       	 		{
          			if(stnd.Class__c == cls.Id)
          			{
              			stnd.School__c = cls.School__c;
          			}
        		}
        	}
        }
    }*/
    
    //Method By Palash Singh
    public static void insertAndUpdateStudentUpdateSchoolAccClass(List<Student__c> newStudents, Map<Id, Student__c> mapOfOldStudents)
    {
      Set<Id> setOfClassIds = new Set<Id>();
      for(Student__c stnd : newStudents != null ? newStudents : mapOfOldStudents.values())
      {
          if(stnd.Class__c != null)
          {
              setOfClassIds.add(stnd.Class__c);
          }
      }
      if(setOfClassIds.size() > 0) 
      {
         Map<Id, Class__c> mapOfClassIdandSchool = new Map<Id, Class__c>([SELECT Id, School__c FROM Class__c WHERE Id IN: setOfClassIds]);
      if(mapOfClassIdandSchool != null)
      {
         for(Student__c std : newStudents)
         {
               std.School__c = mapOfClassIdandSchool.get(std.Class__c).School__c;
         }
       }
       }
    }
}