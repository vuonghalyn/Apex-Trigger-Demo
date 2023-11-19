public with sharing class OrderTriggerHandler {
    public OrderPreventDeletingFulfilledOrder preventDeletion = new OrderPreventDeletingFulfilledOrder();

    public void beforeDelete(List<Order> triggerOld) {
        preventDeletion.filter(order);
    }

    public void postProcess() {
        switch on Trigger.operationType {
            when BEFORE_DELETE {
                preventDeletion.execute();
            }
        }
    } 
}