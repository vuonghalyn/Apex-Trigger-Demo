public inherited sharing class OrderPreventDeletingFulfilledOrder {
    public List<Order> ordersToProcess = new List<Order>();
    public Map<Id, Id> mapInvoiceIdToOrderId = new Map<Id, Id>();

    public void filter (Order order) {
        ordersToProcess.add(order);
        if (order.Invoice__c != null) {
            mapInvoiceIdToOrderId.put(order.Invoice__c, order.Id);  
        }
    }

    public void execute () {
        if (!ordersToProcess.isEmpty()) {
            OrderPreventDeletingFulfilledOrderService.preventDeletingFulfilledOrder(ordersToProcess, mapInvoiceIdToOrderId);
        }
    }
}