#!/bin/bash

# Create .env file in ~/Documents/utilities/ folder

if [ -d ~/Documents/utilities ]    
then
    :
else
    mkdir ~/Documents/utilities
fi

echo "NODE_ENV=production\nREACT_APP_API_URI=https://staging-api.skipid.io\nREACT_APP_REACT_QUERY_DEVTOOLS=false\nREACT_APP_AUTH0_DOMAIN=auth.skipid.org\nREACT_APP_AUTH0_CLIENT_ID=rVgg324pRjwrtiF8FGOQYcsg4zKOyacn\nREACT_APP_AUTH0_CLIENT_AUDIENCE=https://skipid.net\nREACT_APP_AUTH0_CLIENT_AUDIENCE_MFA=https://dev-hvhnhg1u.us.auth0.com/mfa/\nREACT_APP_ULTOREX_URL=https://ultorex.org\nREACT_APP_SENTRY_DSN=https://865c108123e74465aa2bf6412b10b942@o1009406.ingest.sentry.io/6025507" > ~/Documents/utilities/.env
