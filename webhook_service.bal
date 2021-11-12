import gitHubWebhook.connections as conn;
import ballerina/mime;
import ballerina/log;
import ballerina/lang.value;
import ballerina/websub;

isolated service class WebhookService {
    *websub:SubscriberService;
    
    private final conn:GSheetClient clientEp;

    public isolated function init() returns error? {
        self.clientEp = check new();    
    }

    remote isolated function onEventNotification(websub:ContentDistributionMessage event) returns websub:Acknowledgement|error? {
        match event.contentType {
            mime:APPLICATION_JSON => {
                json eventDetails = check value:ensureType(event.content);
                check self.processEventDetails(eventDetails);
            }
            _ => {
                log:printWarn("Could not identify the content-type. Skipping the received content");
            }
        }
        return websub:ACKNOWLEDGEMENT;
    }

    isolated function processEventDetails(json eventDetails) returns error? {
        log:printInfo("Received a payload ", keyvalus = eventDetails);
    }
}
