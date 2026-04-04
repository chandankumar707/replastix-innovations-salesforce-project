public class EmailNotificationHelper {

    public static void sendRestockNotification(List<Re_Plastic_Innovations_Restock_Request__c> restockRequests) {
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for (Re_Plastic_Innovations_Restock_Request__c restock : restockRequests) {

            if (restock.Status__c == 'Approved') {
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

                email.setToAddresses(new List<String>{'warehousemanager@example.com'});
                email.setSubject('Restock Request Approved');
                email.setPlainTextBody(
                    'A restock request has been approved for Product ID: ' + restock.Product__c +
                    '. Requested Quantity: ' + restock.Requested_Quantity__c
                );

                emails.add(email);
            }
        }

        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}
