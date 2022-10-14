/**
*
*  Purpose          :	Trigger on School object.
*
*  Created Date     :  	10/12/2022
*
*  Created By       :  	Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
trigger Trigger_School on School__c (before update, after update) 
{
    try 
    {
        if(Utilities.BypassAllTriggers) 
            return;
        
        if(Trigger.isBefore) 
        {
            if(Trigger.isUpdate)
            {
                SchoolTriggerHelper.updateNoOfClassesDetailsInBeforeCase(trigger.new, trigger.oldMap);
                //SchoolTriggerHelper.updateNoOfStudentsDetailsInBeforeCase(trigger.new, trigger.oldMap);
                SchoolTriggerHelper.updateNoOfStudentsDetailsInBeforeCasePTC(trigger.new, trigger.oldMap);
            }
        }  
        
        if(Trigger.isAfter) 
        {
            if(Trigger.isUpdate)
            {
                //SchoolTriggerHelper.updateNoOfStudentsDetails(trigger.new, trigger.oldMap);
                //SchoolTriggerHelper.updateNoOfClassesDetails(trigger.new, trigger.oldMap);
            }
        }
    }
    catch(Exception e)
    {
        integer i=0;
        if(Trigger.isDelete)
            Trigger.Old[i].addError(e.getMessage());
        else
            Trigger.New[i].addError(e.getMessage());
    } 
}