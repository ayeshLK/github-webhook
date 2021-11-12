import gitHubWebhook.config;
import ballerina/websub;
import ballerina/mime;
import ballerina/log;
import ballerina/lang.value;

@websub:SubscriberServiceConfig {
    target: [config:GITHUB_URL, config:TOPIC_URL],
    callback: config:CALLBACK_URL,
    secret: config:GITHUB_SECRET,
    httpConfig: {
        auth: {
            token: config:GITHUB_AUTH_TOKEN
        }
    }
}
service /webhook on new websub:Listener(config:WEBHOOK_PORT) {
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
