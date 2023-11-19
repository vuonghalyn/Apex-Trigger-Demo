public inherited sharing class OrderPreventDeletingFulfilledOrderService {
    private static Boolean isFulfilled(Order eachOrder, Map<Id, Invoice__c> mapOrderIdToInvoiceId) {
        return (eachOrder.Status__c == 'Order Fulfilled')
    }

    public static void preventDeletingFulfilledOrder(List<Order> ordersToProcess, Map<Id, Id> mapInvoiceIdToOrderId) {
        Map<Id, Invoice__c> mapOrderIdToInvoiceId = new Map<Id, Invoice__c>([SELECT Id, Paying_Status__c FROM Invoice__c WHERE Id In :mapInvoiceIdToOrderId.keySet() AND Paying_Status__c != null]);

        for (Order eachOrder : ordersToProcess) {
            if(isFulfilled(eachOrder,mapOrderIdToInvoiceId)) {
                eachOrder.addError('Cannot delete a fulfilled order.');
            }
        }
    }
}