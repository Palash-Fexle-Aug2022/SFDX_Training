/**
*
*  Purpose          :	Trigger on Student object.
*
*  Created Date     :  	10/13/2022
*
*  Created By       :  	Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
trigger Trigger_Student on Student__c (after insert, after delete, before update, before insert) 
{
    try
    {
        if(Utilities.BypassAllTriggers) 
            return;
        
        if(Trigger.isAfter) 
        {
            if(Trigger.isInsert || Trigger.isDelete)
            {
            	StudentTriggerHelper.updateNoOfStudentsDetails(trigger.new, trigger.oldMap);
            }
        }
        if(Trigger.isBefore)
        {
            if(Trigger.isInsert || Trigger.isUpdate)
            {
                //StudentTriggerHelper.updateClassAndSchoolFieldOnStudent(trigger.new, trigger.oldMap);
                StudentTriggerHelper.insertAndUpdateStudentUpdateSchoolAccClass(trigger.new, trigger.oldMap);
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