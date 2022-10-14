/**
*
*  Purpose          :	Test Class on Sum Class.
*
*  Created Date     :  	10/12/2022
*
*  Created By       :  	Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
@isTest
private class SumTest {
	
    @isTest static void testDoSum() {
        
        Sum ob = new Sum();
     
        System.assertEquals(12, ob.doSum(4, 8));
    }
    
    @isTest static void testDoDivision(){
        
        Sum obj = new Sum();
        
        System.assertEquals(2.5, obj.doDivision(10,4));
    }
}