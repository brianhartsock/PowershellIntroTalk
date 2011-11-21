
#get-rss.ps1
#
# Returns RSS feed
# e.g.
# .\get-rss.ps1 "http://blog.brianhartsock.com/feed/"

param
(
    $url
)

$client = new-object net.webclient
$data = [xml] $client.downloadstring($url)

$data.rss.Channel.Item