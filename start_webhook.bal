import gitHubWebhook.config;
import ballerina/websub;
public function main() returns error? {
    // Start webhook service
    websub:Listener webhookListener = check new(config:WEBHOOK_PORT);
    // Configure webhook service
    websub:SubscriberServiceConfiguration config = {
        target: [config:GITHUB_URL, config:TOPIC_URL],
        callback: config:CALLBACK_URL,
        secret: config:GITHUB_SECRET,
        httpConfig: {
            auth: {
                token: config:GITHUB_AUTH_TOKEN
            }
        }
    };
    websub:SubscriberService webhookService = check new WebhookService();
    check webhookListener.attachWithConfig(webhookService, config, "/webhook");
    check webhookListener.'start();
}
