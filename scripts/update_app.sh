#Slack Notification
curl -X POST --data-urlencode 'payload={"text": "Deployment '${DEPLOYMENT_ID}' of '${APPLICATION_NAME}' on '${DEPLOYMENT_GROUP_NAME}' has started"}' https://hooks.slack.com/services/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

DIR=$(pwd)
cd /home/mymoney/application
echo "updating gems and migrations. running as $(whoami)"
echo "current directory: $(pwd)"
bundle install --without development test
RAILS_ENV=production rake db:migrate
cd $DIR
