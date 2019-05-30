public with sharing class GeneralUtility {
    
    /**
* @description Method to upsert records
* @param recordsToUpsert List of sObject records to be inserted/updated
* @return  List of error messages
* @example Example code usage. This will be wrapped in tags to preserve whitespace
*/
    public static List<String> upsertRecords(List<sObject> recordsToUpsert, Boolean allOrNone, String className, String methodName, Boolean logError) {
        List<String> errorList = new List<String>();
        
        if(recordsToUpsert == null || recordsToUpsert.isEmpty()) {
            return errorList;
        }
        
        List<Database.UpsertResult> upsertResult = Database.upsert(recordsToUpsert, allOrNone);
        
        // iterate over the upsert results
        for(Integer i=0; i<upsertResult.size(); i++) {
            // check if there was an error during record insert/update
            if(!upsertResult[i].success) {
                for(Database.error err: upsertResult[i].errors) {
                    errorList.add('Record: ' + recordsToUpsert.get(i) + '| Error: ' + err.getStatusCode() + ':' + err.getMessage());
                }
            }
        }// for
        
        return errorList;
    }
    
    /**
* @description Method to upsert records
* @param recordsToUpdate List of sObject records to be updated
* @return  List of error messages
* @example Example code usage. This will be wrapped in tags to preserve whitespace
*/
    public static List<String> updateRecords(List<sObject> recordsToUpdate, Boolean allOrNone, String className, String methodName, Boolean logError) {
        List<String> errorList = new List<String>();
        
        if(recordsToUpdate == null || recordsToUpdate.isEmpty()) {
            return errorList;
        }
        
        List<Database.SaveResult> updateResult = Database.update(recordsToUpdate, allOrNone);
        
        // iterate over the upsert results
        for(Integer i=0; i<updateResult.size(); i++) {
            // check if there was an error during record insert/update
            if(!updateResult[i].success) {
                for(Database.error err: updateResult[i].errors) {
                    errorList.add('Record: ' + recordsToUpdate.get(i) + '| Error: ' + err.getStatusCode() + ':' + err.getMessage());
                }
            }
        }// for
        
        return errorList;
    }
    
    /**
* @description Method to delete records
* @param recordsToUpsert List of sObject records to be delete
* @return  List of error messages
* @example Example code usage. This will be wrapped in tags to preserve whitespace
*/
    public static List<String> deleteRecords(List<sObject> recordsToDelete, Boolean allOrNone, String className, String methodName, Boolean logError) {
        List<String> errorList = new List<String>();
        
        if(recordsToDelete == null || recordsToDelete.isEmpty()) {
            return errorList;
        }
        
        List<Database.DeleteResult> deleteResult = Database.delete(recordsToDelete, allOrNone);
        
        // iterate over the upsert results
        for(Integer i=0; i<deleteResult.size(); i++) {
            // check if there was an error during record deletion
            if(!deleteResult[i].success) {
                for(Database.error err: deleteResult[i].errors) {
                    errorList.add('Record: ' + recordsToDelete.get(i) + '| Error: ' + err.getStatusCode() + ':' + err.getMessage());
                }
            }
        }// for
        
        return errorList;
    }
}