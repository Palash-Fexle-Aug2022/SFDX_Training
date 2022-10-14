/**
*
*  Purpose          :	Test Class for DynamicWaysToDealsWithCollections Class
*
*  Created Date     :  	10/06/2022
*
*  Created By       :  	Palash Singh
*
*  Revision Logs    :  	V_1.0 - Created
*
**/
@isTest
public class DynamicWaysToDealsWithCollectionsTest {
	@testSetup
    static void testData() {
      School__c testSchool = new School__c();
      testSchool.Name = 'Test School';
      insert testSchool;
        
      Class__c testClass1 = new Class__c();
      testClass1.Name = 'Test Class One';
      testClass1.School__c = testSchool.Id;
      insert testClass1;
        
      Student__c testStudent = new Student__c();
      testStudent.Name = 'Test Student';
      testStudent.Class__c = testClass1.Id;
      insert testStudent;
       
      Student__c testStudent1 = new Student__c();
      testStudent1.Name = 'Test Student One';
      testStudent1.Class__c = testClass1.Id;
      insert testStudent1;
    }
    @isTest
    static void myTestOne() {
        List<Student__c> expectedStudentList = [SELECT ID, Name, Class__c FROM Student__c WHERE Name Like 'Test%'];
        Map<String, Map<String, List<Student__c>>> studentList = DynamicWaysToDealsWithCollections.DynamicWaysToDealsWithCollections();
     	System.assertEquals(expectedStudentList[0].name, studentList.get('Test School').get('Test Class One')[0].name);
        System.assertEquals(expectedStudentList[1].name, studentList.get('Test School').get('Test Class One')[1].name);
    }
}