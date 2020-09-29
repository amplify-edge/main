# dev

WORK


1. User Questions and Answers
- Make a collection of the data model
- Ability to base64 encode / decode, so it can be sent via email AND saved in DB.
- Saves the base64 to disk and use as mock data.
- WHen Server API is ready can start to use it.

2. Signup
- we will serialse all he user entered data into a base64 then
- tell serve the emailaddress and base64 data and it will make the email (and create a non verified user account) and
- send with the email which has a link the user clicks then
- opens the app again to the "thankyou Signup" page, and client deserialises the base 64 and emailaddress and
- sends to server which saves the data to the DB ( user_projects ) and
- server ACK to client and client says "verified" to user.
- STOP

3. Select Campaign, My Campaign, Create Campaign
What is on HOME:
- New user sees "Select Campaign: https://maintemplate.ci.getcouragenow.org/#/orgs
- Existing User sees "My Campaigns": https://maintemplate.ci.getcouragenow.org/#/orgs

If user. 