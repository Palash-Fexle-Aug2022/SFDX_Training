/**
*
*  Purpose          :	Trigger on Account object.
*
*  Created Date     :  	10/12/2022
*
*  Created By       :  	Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
trigger Trigger_Account on Account (before insert) {
    for(Account acc : Trigger.new){
        if(acc.name == 'Fexle'){
            acc.name = acc.name +'-'+date.today();
        }
    }
}