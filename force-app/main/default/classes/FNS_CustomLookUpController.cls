/**
 * Copyright (c) 2019, Brillio
 * All rights reserved.
 * @author Brillio
 * @date 2019
 * @group Utility Class
 * @description This class is used to create custom lookup component.
 */  
public with sharing class FNS_CustomLookUpController {
	@AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName) {
        system.debug('ObjectName-->' + ObjectName);
        String searchKey = searchKeyWord + '%';
        
        List < sObject > returnList = new List < sObject > ();
      
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        String sQuery =  'select id, Name from ' +String.escapeSingleQuotes(ObjectName) + ' where Name LIKE: searchKey order by createdDate DESC limit 5';
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
}