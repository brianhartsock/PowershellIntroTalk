# get-tweets.ps1
#
# Usage: get-tweets.ps1 [friends_timeline | user_timeline| mentions | public_timeline]
#
# Hits Twitter API URL https://twitter.com/statuses/friends_timeline.xml and pulls auth info
# from auth.txt

param
(
    $type
)

$url = "friends_timeline","user_timeline","mentions","public_timeline" | 
    where { $_ -eq $type }
    
if(!$url){
    throw "'$type' isn't valid."
}


$client = new-object net.webclient

$client.headers["Authorization"] = "Basic " + (gc auth.txt)

([xml] $client.downloadstring("https://twitter.com/statuses/$url.xml")).statuses.status
