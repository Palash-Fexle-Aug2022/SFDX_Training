/**
*
*  Purpose          :	Test Class to StaticWaysToDealWithCollections Class.
*
*  Created Date     :  	10/04/2022
*
*  Created By       :  	Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
@isTest
	public class StaticWaysToDealWithCollectionsTest {
	@TestSetup
        static void testdata(){
         
            
        }
        @isTest 
        	static void myTestMethod(){
                List<String> ExpectedcityList = new List<String>{'Jaipur','Kota','Jodhpur'};
            	Map<String, Map<String, List<String>>> cityList = StaticWaysToDealWithCollections.StaticWaysToDealWithCollections();
                System.assertEquals(ExpectedcityList, cityList.get('India').get('Rajasthan'));                
        	}
        @isTest 
        	static void myTestMethod2(){
                List<String> ExpectedcityList = new List<String>{'Austin','Houston','Dallas'};
            	Map<String, Map<String, List<String>>> cityList = StaticWaysToDealWithCollections.StaticWaysToDealWithCollections();
                System.assertEquals(ExpectedcityList, cityList.get('United States').get('Texas'));                
        	}
        @isTest 
        	static void myTestMethod3(){
                List<String> ExpectedcityList = new List<String>{'London','Tottneham','Manchester'};
            	Map<String, Map<String, List<String>>> cityList = StaticWaysToDealWithCollections.StaticWaysToDealWithCollections();
                System.assertEquals(ExpectedcityList, cityList.get('United Kingdom').get('England'));                
        	}
	}