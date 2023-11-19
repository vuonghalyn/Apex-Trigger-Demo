trigger OrderTrigger on Order(before delete) {
    OrderTriggerHandler triggerHandler = new OrderTriggerHandler();
    switch on Trigger.operationType {
        when BEFORE_DELETE {
            triggerHandler.beforeDelete(Trigger.old);
        }
    }
    triggerHandler.postProcess();
}