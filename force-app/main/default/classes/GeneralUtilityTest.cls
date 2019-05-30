@isTest
public class TestGeneralUtility {

    @testSetup
    static void setupData() {
        List<Account> testAccounts = new List<Account>();
        for(Integer i=0; i<5; i++) {
            Account acc = new Account(Name = 'Test Account - ' + i);
            testAccounts.add(acc);
        }

        insert testAccounts;
    }

    @isTest
    static void testDataUpsert(){ 
        List<Account> accounts = [Select Id, Name, Industry from Account];
        for(Account acc: accounts) {
            acc.Industry = 'Agriculture';
        }
        Test.startTest();
            List<String> errors = GeneralUtility.upsertRecords(accounts, true, 'TestGeneralUtility', 'testDataUpsert', false);
            System.debug('errors:' + errors);
        Test.stopTest();
        System.assertEquals(true, errors.isEmpty(), 'There was an error in upsert operation');
    }

    @isTest
    static void testDataUpdate() {
        List<Account> accounts = [Select Id, Name, Industry from Account];
        for(Account acc: accounts) {
            acc.Industry = 'Agriculture';
        }
        Test.startTest();
            List<String> errors = GeneralUtility.updateRecords(accounts, true, 'TestGeneralUtility', 'testDataUpdate', false);
            System.debug('errors:' + errors);
        Test.stopTest();
        System.assertEquals(true, errors.isEmpty(), 'There was an error in upsert operation');
    }

    @isTest
    static void testDataDelete() {
        List<Account> accounts = [Select Id, Name, Industry from Account];
        Test.startTest();
            List<String> errors = GeneralUtility.deleteRecords(accounts, true, 'TestGeneralUtility', 'testDataDelete', false);
            System.debug('errors:' + errors);
        Test.stopTest();
        System.assertEquals(true, errors.isEmpty(), 'There was an error in upsert operation');
    }
}