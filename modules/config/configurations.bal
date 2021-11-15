# The port that is used to start the webhook
public configurable int WEBHOOK_PORT = 9090;

# GitHub Webhook Service URL
public configurable string GITHUB_URL = "https://github";

# GitHub Webhook Topic
public configurable string TOPIC_URL = "https://topic";

# GitHub authentication token to be used in the subscriber-service
public configurable string GITHUB_AUTH_TOKEN = "test123#";

# Public URL for the Subscriber Service
public configurable string CALLBACK_URL = "https://";

# Secret Key to be used to authenticate content
public configurable string GITHUB_SECRET = "test123#";

# Google sheets client-Id
public configurable string CLIENT_ID = "client-1";

# Google sheets client-secret
public configurable string CLIENT_SECRET = "secret-1";

# Google sheets refresh-token
public configurable string REFRESH_TOKEN = "r-token-1";
