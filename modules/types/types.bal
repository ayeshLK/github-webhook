# GitHub user details.
#
# + login - The username of the GitHub user  
# + id - The user Id of the GitHub user  
# + node_id -   
# + avatar_url -   
# + gravatar_id -   
# + url - User profile URL  
# + html_url -   
# + followers_url - The URL to retrieve followers of current user 
# + following_url - The URL to retrieve users which is followed by the current user  
# + gists_url -   
# + starred_url -   
# + subscriptions_url -   
# + organizations_url -   
# + repos_url -   
# + events_url -   
# + received_events_url -   
# + type - The user type  
# + site_admin - Flag to notify whether this user is an admin user  
public type User record {|
    string login;
    int id;
    string node_id;
    string avatar_url;
    string gravatar_id;
    string url;
    string html_url;
    string followers_url;
    string following_url;
    string gists_url;
    string starred_url;
    string subscriptions_url;
    string organizations_url;
    string repos_url;
    string events_url;
    string received_events_url;
    string 'type;
    boolean site_admin;
|};

# GitHub labed details.
#
# + id - Label Id
# + node_id -   
# + url - Label URL  
# + name - Label name  
# + color - Color of the label  
# + default - Flag to notify whether this is a default label for the repository  
public type Label record {|
    int id;
    string node_id;
    string url;
    string name;
    string color;
    boolean default;
|};

# GitHub repository resource details
#
# + id - Repository Id  
# + node_id -   
# + name - Repository name 
# + full_name - Complete name of the repository  
# + private - Flag to notify whether the repository is private or not  
# + owner - The user details of the repository owner  
# + default_branch - The default branch for the repository  
public type Repository record {
    int id;
    string node_id;
    string name;
    string full_name;
    boolean 'private;
    User owner;
    string default_branch;
};

# Common GitHub Event payload.
# 
# + action - The specific activity that triggered the event
# + sender - The user that triggered the event
# + repository - The repository where the event occurred
# + organization - Optional `Organization` details if the webhook is configurred for organization
# + installation - Optional `installation` details if the webhook is configurred for a GitHub App
public type GitHubEvent record {|
    string action?;
    User sender;
    Repository repository;
    json organization?;
    json installation?;
|};

# Event payload for an activity related to a GitHub issue.
#
# + issue - The issue details  
# + changes - Changes for the issue/issue-title/issue-body  
# + assignee - The optional user who was assigned or unassigned from the issue
# + label - The optional label that was added or removed from the issue  
public type Issues record {|
    *GitHubEvent;
    json issue;
    json changes;
    User assignee?;
    Label label?;
|};


# Event payload for an activity related to a GitHub pull request.
#
# + number - The pull request number
# + changes - Changes related to the PR/PR title/PR body  
# + pull_request - The pull request details  
public type PR record {|
    *GitHubEvent;
    int number;
    json changes;
    json pull_request;
|};

# Event payload when a user forks a repository.
#
# + forkee - The created repository resource 
public type Fork record {|
    *GitHubEvent;
    Repository forkee;
|};

# Event payload for an activity related to a repository being starred.
#
# + starred_at - The time the star was created  
public type Star record {|
    *GitHubEvent;
    string starred_at;
|};
