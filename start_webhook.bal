import gitHubWebhook.config;
import ballerina/websub;
public function main() returns error? {
    // Start webhook service
    websub:Listener webhookListener = check new(config:WEBHOOK_PORT);
    // Configure webhook service
    websub:SubscriberServiceConfiguration config = {
        target: config:HUB_URL,
        callback: config:CALLBACK_URL,
        secret: config:SECRET,
        appendServicePath: config:APPEND_SERVICE_PATH
    };
    websub:SubscriberService webhookService = check new WebhookService();
    check webhookListener.attachWithConfig(webhookService, config, "/webhook");
    check webhookListener.'start();
}
