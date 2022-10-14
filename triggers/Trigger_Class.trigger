/**
*
*  Purpose          :	Trigger on Class object.
*
*  Created Date     :  	10/12/2022
*
*  Created By       :   Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
trigger Trigger_Class on Class__c (after insert, after delete, after update) 
{
    try 
    {
        if(Utilities.BypassAllTriggers) 
            return;
        
        if(Trigger.isAfter) 
        {
            if(Trigger.isInsert || Trigger.isDelete)
            {
                ClassTriggerHelper.updateNoOfClassesDetails(trigger.new, trigger.oldMap);
            }
            if(Trigger.isUpdate)
            {
                ClassTriggerHelper.updateSchoolOnRelatedStudent(trigger.new, trigger.oldMap);
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