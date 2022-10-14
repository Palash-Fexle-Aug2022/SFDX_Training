@isTest
public without sharing class TestDataFactory 
{
    public static School__c createSchool() 
    {
        School__c school = (School__c)SmartFactory.createSObject('School__c');
        insert school;
        System.assert(school.Id != null);
        System.assert(school.Name != null);
        return school;
    }
    
    public static Class__c createClass() 
    {
        Class__c cls = (Class__c)SmartFactory.createSObject('Class__c');
        insert cls;
        System.assert(cls.Id != null);
        System.assert(cls.Name != null);
        return cls;
    }
    
    public static Student__c createStudent() 
    {
        Student__c student = (Student__c)SmartFactory.createSObject('Student__c');
        insert student;
        System.assert(student.Id != null);
        System.assert(student.Name != null);
        return student;
    }
}