/**
*
*  Purpose          :	Helper Class for Trigger on Class object.
*
*  Created Date     :  	10/12/2022
*
*  Created By       :  	Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
public without sharing class ClassTriggerHelper 
{
    //Method by Abhinav Sir
    public static void updateNoOfClassesDetails(List<Class__c> classes, Map<Id, Class__c> mapOfOldClasses) 
    {
        Set<Id> setOfParentSchools = new Set<Id>();
        for(Class__c cls : classes != null ? classes : mapOfOldClasses.values()) 
        {
            if(cls.School__c != null) 
            {
                setOfParentSchools.add(cls.School__c);
            }
        }
        
        if(setOfParentSchools.size() > 0) 
        {
        	CountsManager.updateNoOfClassesDetails(setOfParentSchools);   
        }
    }
    
    //Method By Palash Singh
    public static void updateSchoolOnRelatedStudent(List<Class__c> newClasses, Map<Id, Class__c> mapOfOldClasses)
	{
		Set<Id> setOfClassIds = new Set<Id>();
		for(Class__c cls : newClasses != null ? newClasses : mapOfOldClasses.values())
		{
			if(cls.School__c != null && mapOfOldClasses != null && cls.School__c != mapOfOldClasses.get(cls.Id).School__c) 
			{
				setOfClassIds.add(cls.Id);
			} 
		}
		List<Student__c> studentList = new List<Student__c>();
		for(Student__c studentDetails : [SELECT Id, School__c, Class__c, Class__r.School__c FROM Student__c WHERE Class__c IN: setOfClassIds])
		{	
			if(studentDetails != null)
			{
			Student__c stu = new Student__c();
			stu.Id = studentDetails.Id;
			stu.School__c = studentDetails.Class__r.School__c;
			studentList.add(stu);
			}
		}
		if(studentList.size() > 0)
		{
		update studentList;
		}
	}
}