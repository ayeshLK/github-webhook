import gitHubWebhook.connections;
import ballerina/websub;

isolated service class WebhookService {
    *websub:SubscriberService;
    
    private final connections:GSheetClient clientEp;

    public isolated function init() returns error? {
        self.clientEp = check new();    
    }

    remote function onEventNotification(websub:ContentDistributionMessage event) returns websub:Acknowledgement? {
        // TODO: implement logic here
        return websub:ACKNOWLEDGEMENT;
    }
}
