/**
*
*  Purpose          :	Helper Class for Trigger on School object.
*
*  Created Date     :  	10/12/2022
*
*  Created By       :  	Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
public without sharing class SchoolTriggerHelper 
{
    //Method by Abhinav Sir
    public static void updateNoOfStudentsDetails(List<School__c> schools, Map<Id, School__c> mapOfOldSchools) 
    {
        Set<Id> setOfEligibleSchools = new Set<Id>();
        for(School__c sc : schools)
        {
            //Only execute in the case of update
            //Only execute the following logic if someone changes the value of "No of Students" field value
            if(mapOfOldSchools != null && sc.No_of_Students__c != mapOfOldSchools.get(sc.Id).No_of_Students__c)
            {
                setOfEligibleSchools.add(sc.Id);    
            }
        }
        //Only execute the following logic if we will have the eligible school record(s)
        if(setOfEligibleSchools.size() > 0)
        {
            //An additional query because trigger.new is a read only collection in case of after event
            Map<Id, School__c> mapOfSchools = new Map<Id, School__c>();
            for(School__c sch : [SELECT ID, No_of_Students__c 
                                 FROM School__c
                                 WHERE ID IN : setOfEligibleSchools
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
    public static void updateNoOfStudentsDetailsInBeforeCase(List<School__c> schools, Map<Id, School__c> mapOfOldSchools)
    {
        Set<Id> setOfSchoolIds = new Set<Id>();
        for(School__c Schl :schools)
        {
            setOfSchoolIds.add(Schl.Id);
        }
        if(setOfSchoolIds.size() > 0)
        {
            Map<Id, Integer> mapOfSchoolIdWithNoOfStudents = new Map<Id, Integer>();
            for(Student__c stnd : [SELECT Id, School__c
                                  FROM Student__c
                                   WHERE School__c IN : setOfSchoolIds])
            {
                if(!mapOfSchoolIdWithNoOfStudents.containsKey(stnd.School__c))
                {
                    mapOfSchoolIdWithNoOfStudents.put(stnd.School__c, 1);
                }
                else
                {
                  mapOfSchoolIdWithNoOfStudents.put(stnd.School__c, (mapOfSchoolIdWithNoOfStudents.get(stnd.School__c)+1));  
                }              
            }
            if(mapOfSchoolIdWithNoOfStudents.values().size() > 0)
            {
                for(School__c scl : schools)
                {
                    if(mapOfSchoolIdWithNoOfStudents.get(scl.Id) != null)
                    {
                        scl.No_of_Students__c = mapOfSchoolIdWithNoOfStudents.get(scl.Id);
                    }
                }
            }
        }
    }
    
    
    
    
    //Method By Palash Singh
    public static void updateNoOfStudentsDetailsInBeforeCasePTC(List<School__c> newSchools, Map<Id, School__c> mapOfOldSchools)
    {
        Set<Id> setOfSchoolIds = new Set<Id>();
        for(School__c Schl : newSchools)
        {
            setOfSchoolIds.add(Schl.Id);
        }
        if(setOfSchoolIds.size() > 0)
        {
            Map<Id, Integer> mapOfSchoolIdWithNoOfStudents = new Map<Id, Integer>();
            for(School__c schl : [SELECT Id, (SELECT Id, Name, School__c FROM Students__r) FROM School__c WHERE Id IN: setOfSchoolIds])
            {   
                if(!mapOfSchoolIdWithNoOfStudents.containsKey(schl.Id))
                {
                  mapOfSchoolIdWithNoOfStudents.put(schl.Id, (schl.Students__r.size()));
                }
                else
                {
                  mapOfSchoolIdWithNoOfStudents.put(schl.Id, (schl.Students__r.size()));  
                }
            }
			if(mapOfSchoolIdWithNoOfStudents != null)
			{
				for(School__c scl : newSchools)
				{
					scl.No_of_Students__c = mapOfSchoolIdWithNoOfStudents.get(scl.Id);
				}
			}
    	}
    }
    
    
    //Method by Abhinav Sir
    public static void updateNoOfClassesDetailsInBeforeCase(List<School__c> schools, Map<Id, School__c> mapOfOldSchools) 
    {
        Set<Id> setOfSchoolsIds = new Set<Id>();
        for(School__c sch : schools)
        {
            setOfSchoolsIds.add(sch.Id);
        }
        if(setOfSchoolsIds.size() > 0) 
        {
            //Map to hold the school record Id as a key and then upto recalcualted no of classes counts as value
            Map<Id, Integer> mapOfSchooldIdWithNoOfClassesCounts = new Map<Id, Integer>();
            for(Class__c cls : [SELECT Id, School__c 
                                FROM Class__c 
                                WHERE School__c IN : setOfSchoolsIds])
            {
                if(!mapOfSchooldIdWithNoOfClassesCounts.containsKey(cls.School__c)) 
                {
                    mapOfSchooldIdWithNoOfClassesCounts.put(cls.School__c, 1);
                }
                else 
                {
                    mapOfSchooldIdWithNoOfClassesCounts.put(cls.School__c, (mapOfSchooldIdWithNoOfClassesCounts.get(cls.School__c) + 1));
                }
            }
            if(mapOfSchooldIdWithNoOfClassesCounts.values().size() > 0) 
            {
                for(School__c sc : schools) 
                {
                    if(mapOfSchooldIdWithNoOfClassesCounts.get(sc.Id) != null) 
                    {
                    	sc.No_Of_Classes__c = mapOfSchooldIdWithNoOfClassesCounts.get(sc.Id);    
                    }
                }
            }
        }
    }    
    
    
    //Method by Abhinav Sir
    public static void updateNoOfClassesDetails(List<School__c> schools, Map<Id, School__c> mapOfOldSchools) 
    {
        Set<Id> setOfEligibleSchools = new Set<Id>();
        for(School__c sc : schools)
        {
            //Only execute in the case of update
            //Only execute the following logic if someone changes the value of "No of Classes" field value
            if(mapOfOldSchools != null && sc.No_of_Classes__c  != mapOfOldSchools.get(sc.Id).No_of_Classes__c )
            {
                setOfEligibleSchools.add(sc.Id);    
            }
        }     
        //Only execute the following logic if we will have the eligible school record(s)
        if(setOfEligibleSchools.size() > 0)
        {
            //An additional query because trigger.new is a read only collection in case of after event
            List<School__c> listOfSchoolsToBeUpdated = [SELECT ID, No_of_Classes__c,
                                                        (SELECT ID FROM Classes__r) 
                                                        FROM School__c
                                                        WHERE ID IN : setOfEligibleSchools
                                                       ];
            if(listOfSchoolsToBeUpdated.size() > 0) 
            {
                for(School__c sch : listOfSchoolsToBeUpdated) 
                {
                    sch.No_of_Classes__c = sch.Classes__r.size();
                }
                Utilities.BypassAllTriggers = true;
                update listOfSchoolsToBeUpdated;
                Utilities.BypassAllTriggers = false;
            }
        }
    }
}